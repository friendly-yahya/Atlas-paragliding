import 'elevated_card.dart';
import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
    
      //minHeight: 155,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,  
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '31°',
              style: AppTheme.kDisplayHero,
            ),
            Text(
              '/1200m',
              style: AppTheme.kDisplaySub,
            )
          ],
        ),
        Text(
          'Ouirgane',
          style: AppTheme.kDisplaySub.copyWith(
            color: AppTheme.backgroundColor.withValues(alpha: 0.8)
          ),
        ),
        SizedBox(height: AppTheme.space24,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.wb_cloudy_outlined,
                  color: AppTheme.backgroundColor.withValues(alpha: 0.8),
                  size: 24,
                ),
                SizedBox(width: AppTheme.space4,),
                Text(
                  '15km/h, W',
                  style: AppTheme.paragraphSmRegular.copyWith(
                    color: AppTheme.backgroundColor.withValues(alpha: 0.8)
                  ) ,
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.visibility_outlined,
                  color: AppTheme.backgroundColor.withValues(alpha: 0.8),
                  size: 24,
                ),
                SizedBox(width: AppTheme.space4,),
                Text(
                  '25Km',
                  style: AppTheme.paragraphSmRegular.copyWith(
                    color: AppTheme.backgroundColor.withValues(alpha: 0.8)
                  ) ,
                )
              ],
            )
          ],
        ) 
       ],
      ));
  }
}