import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/client/safety_and_health_check/safety_health_check.dart';
import 'package:flutter/material.dart';

class BookingFooter extends StatelessWidget {
  const BookingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space16,
        vertical: AppTheme.space12,
      ),
      decoration: BoxDecoration(
        color: cs.surface,
        border: Border(
          top: BorderSide(color: cs.outline, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('MAD 800', style: AppTheme.heading3.copyWith(color: cs.onSurface)),
                    const SizedBox(width: AppTheme.space4),
                    Text(
                      '/ person',
                      style: AppTheme.paragraphMiniRegular.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.space2),
                Text(
                  'Tandem flight · Oct 19 at 10:00 AM',
                  style: AppTheme.paragraphMiniRegular.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppTheme.space2),
                Row(
                  children: [
                    Text(
                      'Free cancellation',
                      style: AppTheme.paragraphMiniRegular.copyWith(
                        color: cs.primary.withValues(alpha: 0.75),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: AppTheme.space4),
                    Icon(
                      Icons.help,
                      size: 14,
                      color: cs.primary.withValues(alpha: 0.75),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SafetyHealthCheck()),
            ),
            style: AppTheme.pillButtonPrimary(context),
            child: const Text('Book'),
          ),
        ],
      ),
    );
  }
}