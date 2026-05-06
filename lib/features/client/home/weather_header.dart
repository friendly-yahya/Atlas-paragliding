import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Find your flight', style: AppTheme.heading1),
            const SizedBox(height: AppTheme.space2),
            Text(
              'Agergour, Morocco',
              style: AppTheme.paragraphSmMedium.copyWith(
                color: cs.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppTheme.space4),
            Row(
              children: [
                Icon(
                  Icons.wb_sunny_rounded,
                  size: 14,
                  color: cs.onSurfaceVariant,
                ),
                const SizedBox(width: AppTheme.space4),
                Text(
                  'Clear & Sunny 28°',
                  style: AppTheme.paragraphMiniMedium.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: AppTheme.space12),
                Icon(
                  Icons.air_rounded,
                  size: 14,
                  color: cs.onSurfaceVariant,
                ),
                const SizedBox(width: AppTheme.space4),
                Text(
                  '14 Km/h NE',
                  style: AppTheme.paragraphMiniMedium.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
        CircleAvatar(
          radius: 22,
          backgroundColor: cs.primary,
          child: Text(
            'AB',
            style: AppTheme.paragraphSmMedium.copyWith(
              color: cs.surface,
            ),
          ),
        ),
      ],
    );
  }
}