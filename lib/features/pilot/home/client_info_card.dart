import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import '../../../core/widgets/avatar.dart';

class ClientInfoCard extends StatelessWidget {
  const ClientInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return Row(
      children: [
        const Avatar(name: 'Abdnour khouya', isOnline: true),
        const SizedBox(width: AppTheme.space8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Abdnour khouya',
              style: AppTheme.paragraphSmMedium.copyWith(
                color: cs.onSurface,
              ),
            ),
            Row(
              children: [
                Text(
                  'Booked at 16:45',
                  style: AppTheme.paragraphMiniMedium.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(width: AppTheme.space4),
                Icon(
                  Icons.circle,
                  size: 6,
                  color: cs.onSurface.withValues(alpha: 0.7),
                ),
                const SizedBox(width: AppTheme.space4),
                Text(
                  'en route',
                  style: AppTheme.paragraphMiniMedium.copyWith(
                    color: cs.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}