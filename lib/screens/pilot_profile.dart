import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/widgets/settings_tile.dart';
import 'package:atlas_paragliding/widgets/settings_tile_group.dart';

// ── Data models ────────────────────────────────────────────
class _TileData {
  const _TileData({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;
}

class _SectionData {
  const _SectionData({
    required this.title,
    required this.tiles,
  });
  final String title;
  final List<_TileData> tiles;
}

// ── Screen ─────────────────────────────────────────────────
class PilotProfile extends StatelessWidget {
  const PilotProfile({super.key, required this.onSwitchToClient});
  final VoidCallback onSwitchToClient;

  @override
  Widget build(BuildContext context) {
    final List<_SectionData> sections = [
      _SectionData(
        title: 'Personal Information',
        tiles: [
          _TileData(icon: Icons.person_outline,             label: 'Full name',        onTap: () {}),
          _TileData(icon: Icons.mail_outline,               label: 'Email Address',    onTap: () {}),
          _TileData(icon: Icons.phone_outlined,             label: 'Phone Numbers',    onTap: () {}),
          _TileData(icon: Icons.description_outlined,       label: 'About/bio',        onTap: () {}),
          _TileData(icon: Icons.card_membership_outlined,   label: 'Certificates',     onTap: () {}),
          _TileData(icon: Icons.record_voice_over_outlined, label: 'Languages Spoken', onTap: () {}),
          _TileData(icon: Icons.location_on_outlined,       label: 'Base Location',    onTap: () {}),
          _TileData(icon: Icons.construction_outlined,      label: 'Equipment',        onTap: () {}),
          _TileData(icon: Icons.more_horiz,                 label: 'More',             onTap: () {}),
        ],
      ),
      _SectionData(
        title: 'Offers',
        tiles: [
          _TileData(icon: Icons.local_offer_outlined, label: 'Manage Offers',  onTap: () {}),
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
          _TileData(icon: Icons.swap_horiz_rounded,     label: 'Switch to Client', onTap: onSwitchToClient),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: AppTheme.kBgDeep,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sections.map((section) => Padding(
              padding: const EdgeInsets.only(bottom: AppTheme.space24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title from the data
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppTheme.space12),
                    child: Text(
                      section.title,
                      style: AppTheme.heading4.copyWith(color: AppTheme.kTextPrimary),
                    ),
                  ),
                  // Tiles
                  SettingsTileGroup(
                    tiles: section.tiles.map((t) => SettingsTile(
                      icon: t.icon,
                      label: t.label,
                      onTap: t.onTap,
                    )).toList(),
                  ),
                ],
              ),
            )).toList(),
          ),
        ),
      ),
    );
  }
}