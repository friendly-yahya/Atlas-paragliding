import 'package:atlas_paragliding/theme/app_theme.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTheme.heading1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppTheme.space8,),
        Text(
          subtitle,
          style: AppTheme.paragraphSmMedium,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _StatItem(
              icon: Icons.star_rounded , 
              label: '${rating.toStringAsFixed(1)}',
              iconColor: AppTheme.starColor,),
                      const SizedBox(width: 16),
            _StatItem(
              label: '+$years Years\nFlying',
              icon: Icons.flight_takeoff,
            ),
            const SizedBox(width: 16),
            _StatItem(
              label: '+$flights Flights',
              icon: Icons.airplanemode_active,
            ),
          ],
        )
      ],
    );
  }
}
class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const _StatItem({
    required this.icon,
    this.iconColor = AppTheme.textPrimary,
    required this.label,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTheme.heading4,
        ),
        SizedBox(width: 4),
        Icon(
          icon,
          size: 24,
          color: iconColor,
        )
      ],
    );
  }
}