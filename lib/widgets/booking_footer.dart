import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/screens/safety_health_check.dart';
import 'package:flutter/material.dart';

class BookingFooter extends StatelessWidget {
  const BookingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space16,
        vertical: AppTheme.space12,
      ),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        border: Border(
          top: BorderSide(color: AppTheme.strokeColor, width: 1),
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
                    Text('MAD 800', style: AppTheme.heading3),
                    const SizedBox(width: AppTheme.space4),
                    Text(
                      '/ person',
                      style: AppTheme.paragraphMiniRegular.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.space2),
                Text(
                  'Tandem flight · Oct 19 at 10:00 AM',
                  style: AppTheme.paragraphMiniRegular.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: AppTheme.space2),
                Row(
                  children: [

                    Text(
                      'Free cancellation',
                      style: AppTheme.paragraphMiniRegular.copyWith(
                        color: Color.fromARGB(190, 59, 131, 246),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: AppTheme.space4),
                    const Icon(
                      Icons.help,
                      size: 14,
                      color: Color.fromARGB(190, 59, 131, 246),
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
            style: AppTheme.bookMainButtonLight,
            child: const Text('Book'),
          ),
        ],
      ),
    );
  }
}