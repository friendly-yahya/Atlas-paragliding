import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/widgets/avatar.dart';

class PilotProfile extends StatelessWidget {
  final VoidCallback? onSwitchToClient;
  const PilotProfile({super.key, this.onSwitchToClient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.kBgDeep,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppTheme.space24),

              // ── Header ──────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Profile', style: AppTheme.heading2.copyWith(color: Colors.white)),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings_outlined, size: 24, color: Color(0xFF9CA3AF)),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.space24),

              // ── Avatar + Info ───────────────────────────────────
              Row(
                children: [
                  Avatar(
                    name: 'Mouad Khouya',
                    isOnline: true,
                    size: 72,
                  ),
                  const SizedBox(width: AppTheme.space16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mouad Khouya', style: AppTheme.heading4.copyWith(color: Colors.white)),
                      const SizedBox(height: 2),
                      Text('mouad@email.com', style: AppTheme.paragraphSmRegular.copyWith(color: const Color(0xFF9CA3AF))),
                      const SizedBox(height: AppTheme.space4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: AppTheme.space8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppTheme.kPrimary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(AppTheme.rounded40),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(width: 6, height: 6, decoration: BoxDecoration(color: AppTheme.kPrimary, shape: BoxShape.circle)),
                            const SizedBox(width: 4),
                            Text('Pilot', style: AppTheme.micro.copyWith(color: AppTheme.kPrimary, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.space24),

              // ── Pilot Info ──────────────────────────────────────
              _SectionLabel(label: 'Pilot Info'),
              const SizedBox(height: AppTheme.space8),
              _InfoCard(
                items: [
                  _InfoItem(icon: Icons.person_outline_rounded,  label: 'Full name',  value: 'Mouad Khouya'),
                  _InfoItem(icon: Icons.phone_outlined,           label: 'Phone',       value: '+212 600 000 000'),
                  _InfoItem(icon: Icons.location_on_outlined,    label: 'Base',        value: 'Ouirgane, Morocco'),
                  _InfoItem(icon: Icons.verified_outlined,       label: 'License',     value: 'FRMF-2019-047'),
                  _InfoItem(icon: Icons.flight_takeoff_outlined, label: 'Experience',  value: '6 years'),
                ],
              ),

              const SizedBox(height: AppTheme.space24),

              // ── Recent Flights ──────────────────────────────────
              _SectionLabel(label: 'Recent Flights'),
              const SizedBox(height: AppTheme.space8),
              _FlightCard(
                clientName: 'Abdnour K.',
                date: 'Mar 23, 2026',
                price: 'MAD 850',
                status: 'Completed',
                statusColor: AppTheme.successColor,
              ),
              const SizedBox(height: AppTheme.space8),
              _FlightCard(
                clientName: 'Sara K.',
                date: 'Mar 22, 2026',
                price: 'MAD 1000',
                status: 'Completed',
                statusColor: AppTheme.successColor,
              ),

              const SizedBox(height: AppTheme.space24),

              // ── Switch to Client Mode ───────────────────────────
              _SectionLabel(label: 'Client Mode'),
              const SizedBox(height: AppTheme.space8),
              _ClientModeCard(onSwitch: () => _handleClientSwitch(context)),

              const SizedBox(height: AppTheme.space24),

              // ── Support ─────────────────────────────────────────
              _SectionLabel(label: 'Support'),
              const SizedBox(height: AppTheme.space8),
              _InfoCard(
                tappable: true,
                items: [
                  _InfoItem(icon: Icons.help_outline_rounded,  label: 'Help center',      value: ''),
                  _InfoItem(icon: Icons.shield_outlined,        label: 'Privacy policy',   value: ''),
                  _InfoItem(icon: Icons.description_outlined,   label: 'Terms of service', value: ''),
                ],
              ),

              const SizedBox(height: AppTheme.space24),

              // ── Sign out ─────────────────────────────────────────
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AppTheme.errorColor,
                    padding: const EdgeInsets.symmetric(vertical: AppTheme.space16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppTheme.rounded8),
                      side: const BorderSide(color: Color(0xFF2C2F3E)),
                    ),
                  ),
                  child: Text('Sign out', style: AppTheme.paragraphSmMedium.copyWith(color: AppTheme.errorColor)),
                ),
              ),

              const SizedBox(height: AppTheme.space32),
            ],
          ),
        ),
      ),
    );
  }

  void _handleClientSwitch(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.kBgCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppTheme.rounded12)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(AppTheme.space24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Switch to Client mode', style: AppTheme.heading3.copyWith(color: Colors.white)),
            const SizedBox(height: AppTheme.space8),
            Text(
              'You\'ll switch to your client account to browse and book flights.',
              style: AppTheme.paragraphSmRegular.copyWith(color: const Color(0xFF9CA3AF)),
            ),
            const SizedBox(height: AppTheme.space24),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onSwitchToClient?.call(); // 🔑 the bridge
                },
                style: AppTheme.primaryButton,
                child: const Text('Switch to Client'),
              ),
            ),
            const SizedBox(height: AppTheme.space8),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: AppTheme.space12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.rounded8),
                    side: const BorderSide(color: Color(0xFF2C2F3E)),
                  ),
                ),
                child: Text('Stay as Pilot', style: AppTheme.paragraphSmMedium.copyWith(color: Colors.white)),
              ),
            ),
            const SizedBox(height: AppTheme.space8),
          ],
        ),
      ),
    );
  }
}

// ── Reusable components ─────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: AppTheme.micro.copyWith(
        color: const Color(0xFF9CA3AF),
        letterSpacing: 1.2,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _InfoItem {
  final IconData icon;
  final String label;
  final String value;
  const _InfoItem({required this.icon, required this.label, required this.value});
}

class _InfoCard extends StatelessWidget {
  final List<_InfoItem> items;
  final bool tappable;
  const _InfoCard({required this.items, this.tappable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.kBgCard,
        border: Border.all(color: const Color(0xFF2C2F3E)),
        borderRadius: BorderRadius.circular(AppTheme.rounded12),
      ),
      child: Column(
        children: List.generate(items.length, (i) {
          final item = items[i];
          final isLast = i == items.length - 1;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.space16,
                  vertical: AppTheme.space12,
                ),
                child: Row(
                  children: [
                    Icon(item.icon, size: 18, color: const Color(0xFF9CA3AF)),
                    const SizedBox(width: AppTheme.space12),
                    Expanded(
                      child: Text(item.label, style: AppTheme.paragraphSmRegular.copyWith(color: Colors.white)),
                    ),
                    if (item.value.isNotEmpty)
                      Text(item.value, style: AppTheme.paragraphSmRegular.copyWith(color: const Color(0xFF9CA3AF))),
                    if (tappable)
                      const Icon(Icons.chevron_right_rounded, size: 18, color: Color(0xFF9CA3AF)),
                  ],
                ),
              ),
              if (!isLast) const Divider(height: 1, color: Color(0xFF2C2F3E)),
            ],
          );
        }),
      ),
    );
  }
}

class _FlightCard extends StatelessWidget {
  final String clientName;
  final String date;
  final String price;
  final String status;
  final Color statusColor;

  const _FlightCard({
    required this.clientName,
    required this.date,
    required this.price,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        color: AppTheme.kBgCard,
        border: Border.all(color: const Color(0xFF2C2F3E)),
        borderRadius: BorderRadius.circular(AppTheme.rounded12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.kPrimary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
            ),
            child: const Icon(Icons.person_outline_rounded, size: 20, color: AppTheme.kPrimary),
          ),
          const SizedBox(width: AppTheme.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(clientName, style: AppTheme.paragraphSmMedium.copyWith(color: Colors.white)),
                Text(date, style: AppTheme.micro.copyWith(color: const Color(0xFF9CA3AF))),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: AppTheme.paragraphSmMedium.copyWith(color: Colors.white)),
              const SizedBox(height: 2),
              Text(status, style: AppTheme.micro.copyWith(color: statusColor, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ClientModeCard extends StatelessWidget {
  final VoidCallback onSwitch;
  const _ClientModeCard({required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        color: AppTheme.kBgCard,
        border: Border.all(color: const Color(0xFF2C2F3E)),
        borderRadius: BorderRadius.circular(AppTheme.rounded12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.kPrimary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
            ),
            child: const Icon(Icons.person_search_outlined, size: 20, color: AppTheme.kPrimary),
          ),
          const SizedBox(width: AppTheme.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Switch to Client mode', style: AppTheme.paragraphSmMedium.copyWith(color: Colors.white)),
                Text(
                  'Browse flights and make bookings',
                  style: AppTheme.micro.copyWith(color: const Color(0xFF9CA3AF)),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppTheme.space8),
          TextButton(
            onPressed: onSwitch,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.kPrimary,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16, vertical: AppTheme.space8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTheme.rounded40)),
              textStyle: AppTheme.paragraphMiniMedium,
            ),
            child: const Text('Switch'),
          ),
        ],
      ),
    );
  }
}