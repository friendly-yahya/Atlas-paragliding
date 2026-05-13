import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BookingInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  final double rating;
  final int years;
  final int flights;

  const BookingInfo({
    super.key,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.years,
    required this.flights,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTheme.heading2.copyWith(color: cs.onSurface),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppTheme.space4),
        Text(
          subtitle,
          style: AppTheme.paragraphSmMedium.copyWith(
            color: cs.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppTheme.space24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _StatItem(
              icon: Icons.star_rounded,
              value: rating.toStringAsFixed(1),
              label: 'Rating',
              iconColor: AppTheme.starColor,
            ),
            const _Divider(),
            _StatItem(
              icon: Icons.flight_takeoff_rounded,
              value: '$years years',
              label: 'Experience',
              iconColor: cs.primary,
            ),
            const _Divider(),
            _StatItem(
              icon: Icons.airplanemode_active_rounded,
              value: '+$flights',
              label: 'Flights done',
              iconColor: cs.primary,
            ),
          ],
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      height: 40,
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.space24),
      color: cs.outline,
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color iconColor;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 22, color: iconColor),
            const SizedBox(width: AppTheme.space4),
            Text(value, style: AppTheme.heading3.copyWith(color: cs.onSurface)),
          ],
        ),
        const SizedBox(height: AppTheme.space4),
        Text(
          label,
          style: AppTheme.paragraphMiniRegular.copyWith(
            color: cs.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}