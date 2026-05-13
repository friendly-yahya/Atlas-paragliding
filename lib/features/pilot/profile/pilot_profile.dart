import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/pilot/profile/settings_tile.dart';
import 'package:atlas_paragliding/features/pilot/profile/settings_tile_group.dart';
import 'package:atlas_paragliding/features/pilot/profile/profile_header.dart';
import 'package:atlas_paragliding/features/pilot/profile/language_set_up/language_screen.dart';
import 'package:atlas_paragliding/features/pilot/profile/manage_offers/manage_offers_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:atlas_paragliding/core/theme/notifiers.dart';

class _TileData {
  const _TileData({required this.icon, required this.label, required this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback onTap;
}

class _SectionData {
  const _SectionData({required this.title, required this.tiles});
  final String title;
  final List<_TileData> tiles;
}

// ── StatefulWidget so we can hold selected languages ────────
class PilotProfile extends ConsumerStatefulWidget {
  const PilotProfile({super.key, required this.onSwitchToClient});
  final VoidCallback onSwitchToClient;

  @override
  ConsumerState<PilotProfile> createState() => _PilotProfileState();
}

class _PilotProfileState extends ConsumerState<PilotProfile> {
  List<SelectedLanguage> _languages = [];

  // subtitle shown on the tile: "English, French" or "Not set"
  String get _languageSubtitle => _languages.isEmpty
      ? 'Not set'
      : _languages.map((l) => l.name).join(', ');

  List<SelectedOffer> _offers = [];

  String get _offersSubtitle => _offers.isEmpty
      ? 'Not set'
      : _offers.map((o) => o.name).join(', ');

  Future<void> _openLanguages() async {
    final result = await Navigator.of(context, rootNavigator: true).push<List<SelectedLanguage>>(

      MaterialPageRoute(
        builder: (_) => LanguagesScreen(selected: _languages),
      ),
    );
    if (result != null) setState(() => _languages = result);
  }


  Future<void> _openOffers() async {
    final result = await Navigator.of(context, rootNavigator: true).push<List<SelectedOffer>>(
      MaterialPageRoute(
        builder: (_) => ManageOffersScreen(offers: _offers),
      ),
    );
  if (result != null) setState(() => _offers = result);
  }
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = ref.watch(pilotThemeProvider) == ThemeMode.dark;
    final List<_SectionData> sections = [
      _SectionData(
        title: 'Personal Information',
        tiles: [
          _TileData(icon: Icons.person_outline,             label: 'Full name',        onTap: () {}),
          _TileData(icon: Icons.mail_outline,               label: 'Email Address',    onTap: () {}),
          _TileData(icon: Icons.phone_outlined,             label: 'Phone Numbers',    onTap: () {}),
          _TileData(icon: Icons.description_outlined,       label: 'About/bio',        onTap: () {}),
          _TileData(icon: Icons.card_membership_outlined,   label: 'Certificates',     onTap: () {}),
          _TileData(icon: Icons.record_voice_over_outlined, label: 'Languages Spoken', onTap: _openLanguages),
          _TileData(icon: Icons.location_on_outlined,       label: 'Base Location',    onTap: () {}),
          _TileData(icon: Icons.construction_outlined,      label: 'Equipment',        onTap: () {}),
          _TileData(icon: Icons.more_horiz,                 label: 'More',             onTap: () {}),
        ],
      ),
      _SectionData(
        title: 'Offers',
        tiles: [
          _TileData(icon: Icons.local_offer_outlined, label: 'Manage Offers', onTap: _openOffers),
          _TileData(icon: Icons.people_outline,       label: 'Client history', onTap: () {}),
        ],
      ),
      _SectionData(
        title: 'Payment Settings',
        tiles: [
          _TileData(icon: Icons.credit_card_outlined,     label: 'Bank account',            onTap: () {}),
          _TileData(icon: Icons.monetization_on_outlined, label: 'Deposit/Payment Methods', onTap: () {}),
          _TileData(icon: Icons.cancel_outlined,          label: 'Cancellation Policy',     onTap: () {}),
        ],
      ),
      _SectionData(
        title: 'App Settings',
        tiles: [
          _TileData(icon: Icons.language,               label: 'Language',         onTap: () {}),
          _TileData(icon: Icons.notifications_outlined, label: 'Notification',     onTap: () {}),
          _TileData(icon: Icons.settings_outlined,      label: 'General settings', onTap: () {}),
          _TileData(icon: Icons.swap_horiz_rounded,     label: 'Switch to Client', onTap: widget.onSwitchToClient),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileHeader(),
              const SizedBox(height: AppTheme.space24),
              // ── Theme toggle ──────────────────────────────
              Padding(
                padding: const EdgeInsets.only(bottom: AppTheme.space24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppTheme.space12),
                      child: Text('Appearance',
                          style: AppTheme.heading4.copyWith(color: cs.onSurface)),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SwitchListTile(
                        tileColor: cs.surfaceContainerHighest,
                        secondary: Icon(
                          isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                          color: cs.primary,
                        ),
                        title: Text('Dark Mode',
                            style: AppTheme.paragraphSmMedium
                                .copyWith(color: cs.onSurface)),
                        value: isDark,
                        activeThumbColor: cs.primary,
                        onChanged: (_) =>
                            ref.read(pilotThemeProvider.notifier).toggle(),
                      ),
                    ),
                  ],
                ),
              ),
              ...sections.map((section) => Padding(
                padding: const EdgeInsets.only(bottom: AppTheme.space24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppTheme.space12),
                      child: Text(section.title,
                          style: AppTheme.heading4.copyWith(color: cs.onSurface)),
                    ),
                    SettingsTileGroup(
                      tiles: section.tiles.map((t) {
                        // Languages tile gets a subtitle showing picked languages
                        final isLanguages = t.label == 'Languages Spoken';
                        final isOffers    = t.label == 'Manage Offers';
                        return SettingsTile(
                          icon: t.icon,
                          label: t.label,
                          subtitle: isLanguages ? _languageSubtitle
                                  : isOffers    ? _offersSubtitle
                                  : null,
                          onTap: t.onTap,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              )),

              const SizedBox(height: AppTheme.space24),
            ],
          ),
        ),
      ),
    );
  }
}