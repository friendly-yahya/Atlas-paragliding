import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
class WeatherHeader extends StatefulWidget {
  const WeatherHeader({super.key});

  @override
  State<WeatherHeader> createState() => _WeatherHeaderState();
}

class _WeatherHeaderState extends State<WeatherHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find your flight',
              style: AppTheme.heading1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Agergour, Morocco',
                  //textAlign: TextAlign.left,
                  style: AppTheme.paragraphSmMedium.copyWith(
                    color: AppTheme.textSecondary
                  
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.wb_sunny_rounded,
                        color: AppTheme.textSecondary,
                        ),
                        Text(
                          'Clear & Sunny 28°',
                          style: AppTheme.paragraphMiniMedium.copyWith(
                            color: AppTheme.textSecondary
                          ),
                          
                        )
                      ],
                    ),
                    SizedBox(width: AppTheme.space12,),
                    Row(
                      children: [
                        Icon(
                          Icons.wind_power_rounded,
                          color: AppTheme.textSecondary,
                        ),
                        Text(
                          '14 Km/h NE ',
                          style: AppTheme.paragraphMiniMedium,
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
        Stack(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppTheme.primaryColor,
              child: Text('AB',style: AppTheme.paragraphSmMedium.copyWith(
                color: AppTheme.backgroundColor
              ) ,),
              
            )
          ],
        )
      ],
    );
  }
}