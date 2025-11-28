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
      children: [
        Column(
          children: [
            Text(
              'Find your flight',
              style: AppTheme.heading1,
            ),
            Column(
              children: [
                Text(
                  'Agergour, Morocco',
                  style: AppTheme.paragraphSmMedium.copyWith(
                    color: AppTheme.textSecondary
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [

                      ],
                    ),
                    Row(
                      children: [
                        
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(height: 40 , width: 40,)
      ],
    );
  }
}