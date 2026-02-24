import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
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
                  Text('Profile', style: AppTheme.heading2),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings_outlined, size: 24, color: AppTheme.textSecondary),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.space24),

              // ── Avatar + Info ───────────────────────────────────
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text('Y', style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryColor,
                          )),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppTheme.backgroundColor, width: 2),
                          ),
                          child: const Icon(Icons.edit, size: 11, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: AppTheme.space16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Friendly Yahya', style: AppTheme.heading4),
                      const SizedBox(height: 2),
                      Text('yahya@email.com', style: AppTheme.paragraphSmRegular.copyWith(color: AppTheme.textSecondary)),
                      const SizedBox(height: AppTheme.space4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: AppTheme.space8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppTheme.successColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(AppTheme.rounded40),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppTheme.successColor, shape: BoxShape.circle)),
                            const SizedBox(width: 4),
                            Text('Client', style: AppTheme.micro.copyWith(color: AppTheme.successColor, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.space32),

              // ── Personal Info ───────────────────────────────────
              _SectionLabel(label: 'Personal Info'),
              const SizedBox(height: AppTheme.space8),
              _InfoCard(
                items: [
                  _InfoItem(icon: Icons.person_outline_rounded, label: 'Full name', value: 'Friendly Yahya'),
                  _InfoItem(icon: Icons.phone_outlined, label: 'Phone', value: '+212 657 582 894'),
                  _InfoItem(icon: Icons.location_on_outlined, label: 'Location', value: 'Marrakech, Morocco'),
                ],
              ),

              const SizedBox(height: AppTheme.space24),

              // ── Booking History ─────────────────────────────────
              _SectionLabel(label: 'Booking History'),
              const SizedBox(height: AppTheme.space8),
              _BookingHistoryCard(
                pilotName: 'Hicham L.',
                date: 'Oct 19, 2024',
                price: 'MAD 850',
                status: 'Completed',
                statusColor: AppTheme.successColor,
              ),
              const SizedBox(height: AppTheme.space8),
              _BookingHistoryCard(
                pilotName: 'Mouad Pi.',
                date: 'Sep 3, 2024',
                price: 'MAD 1000',
                status: 'Cancelled',
                statusColor: AppTheme.errorColor,
              ),

              const SizedBox(height: AppTheme.space24),

              // ── Switch to Pilot Mode ────────────────────────────
              _SectionLabel(label: 'Pilot Mode'),
              const SizedBox(height: AppTheme.space8),
              _PilotModeCard(onSwitch: () => _handlePilotSwitch(context)),

              const SizedBox(height: AppTheme.space24),

              // ── Support ─────────────────────────────────────────
              _SectionLabel(label: 'Support'),
              const SizedBox(height: AppTheme.space8),
              _InfoCard(
                items: [
                  _InfoItem(icon: Icons.help_outline_rounded, label: 'Help center', value: ''),
                  _InfoItem(icon: Icons.shield_outlined, label: 'Privacy policy', value: ''),
                  _InfoItem(icon: Icons.description_outlined, label: 'Terms of service', value: ''),
                ],
                tappable: true,
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
                      side: const BorderSide(color: AppTheme.strokeColor),
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

  void _handlePilotSwitch(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppTheme.rounded12)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(AppTheme.space24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Switch to Pilot mode', style: AppTheme.heading3),
            const SizedBox(height: AppTheme.space8),
            Text(
              'Do you have an existing verified pilot account or are you new?',
              style: AppTheme.paragraphSmRegular.copyWith(color: AppTheme.textSecondary),
            ),
            const SizedBox(height: AppTheme.space24),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: swap to pilot UI
                },
                style: AppTheme.primaryButton,
                child: const Text('I have a pilot account'),
              ),
            ),
            const SizedBox(height: AppTheme.space8),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: navigate to pilot onboarding
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.textPrimary,
                  padding: const EdgeInsets.symmetric(vertical: AppTheme.space12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.rounded8),
                    side: const BorderSide(color: AppTheme.strokeColor),
                  ),
                ),
                child: Text('I\'m new — set up my pilot profile', style: AppTheme.paragraphSmMedium),
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
        color: AppTheme.textSecondary,
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
        border: Border.all(color: AppTheme.strokeColor),
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
                    Icon(item.icon, size: 18, color: AppTheme.textSecondary),
                    const SizedBox(width: AppTheme.space12),
                    Expanded(
                      child: Text(item.label, style: AppTheme.paragraphSmRegular),
                    ),
                    if (item.value.isNotEmpty)
                      Text(item.value, style: AppTheme.paragraphSmRegular.copyWith(color: AppTheme.textSecondary)),
                    if (tappable)
                      const Icon(Icons.chevron_right_rounded, size: 18, color: AppTheme.textSecondary),
                  ],
                ),
              ),
              if (!isLast) const Divider(height: 1, color: AppTheme.strokeColor),
            ],
          );
        }),
      ),
    );
  }
}

class _BookingHistoryCard extends StatelessWidget {
  final String pilotName;
  final String date;
  final String price;
  final String status;
  final Color statusColor;

  const _BookingHistoryCard({
    required this.pilotName,
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
        border: Border.all(color: AppTheme.strokeColor),
        borderRadius: BorderRadius.circular(AppTheme.rounded12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
            ),
            child: const Icon(Icons.paragliding_rounded, size: 20, color: AppTheme.primaryColor),
          ),
          const SizedBox(width: AppTheme.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pilotName, style: AppTheme.paragraphSmMedium),
                Text(date, style: AppTheme.micro.copyWith(color: AppTheme.textSecondary)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: AppTheme.paragraphSmMedium),
              const SizedBox(height: 2),
              Text(status, style: AppTheme.micro.copyWith(color: statusColor, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}

class _PilotModeCard extends StatelessWidget {
  final VoidCallback onSwitch;
  const _PilotModeCard({required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.strokeColor),
        borderRadius: BorderRadius.circular(AppTheme.rounded12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
            ),
            child: const Icon(Icons.paragliding_outlined, size: 20, color: AppTheme.primaryColor),
          ),
          const SizedBox(width: AppTheme.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Switch to Pilot mode', style: AppTheme.paragraphSmMedium),
                Text(
                  'Offer flights and manage bookings',
                  style: AppTheme.micro.copyWith(color: AppTheme.textSecondary),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppTheme.space8),
          TextButton(
            onPressed: onSwitch,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
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