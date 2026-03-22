import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'avatar.dart';

class ClientInfoCard extends StatelessWidget {
  const ClientInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar(name: 'Abdnour khouya', isOnline: true),
        SizedBox(width: AppTheme.space8,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Abdnour khouya',
              style: AppTheme.paragraphSmMedium.copyWith(
                color: AppTheme.backgroundColor,
              ),
            ),
            SizedBox(height: AppTheme.space4,),
            Row(

              children: [
                Text(
                  'Booked at 16:45',
                  style: AppTheme.paragraphMiniMedium.copyWith(
                    color: AppTheme.backgroundColor.withValues(alpha: 0.7),
                  )
                ),
                SizedBox(width: AppTheme.space4,),
                Icon(
                  Icons.circle,
                  size: 6,
                  color: AppTheme.backgroundColor.withValues(alpha: 0.7),
                ),
                SizedBox(width: AppTheme.space4,),
                Text(
                  'en route',
                  style: AppTheme.paragraphMiniMedium.copyWith(
                    color: AppTheme.kPrimary
                  ),
                )
              ],
            )
          ],
        ),

      ],
    );
  }
}