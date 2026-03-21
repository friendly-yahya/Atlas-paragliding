import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';

class WeatherCard extends StatelessWidget {
  final double temperature;
  final int altitude;
  final String location;
  final double windSpeed;
  final String windDirection;
  final int visibility;

  const WeatherCard({
    super.key,
    required this.temperature,
    required this.altitude,
    required this.location,
    required this.windSpeed,
    required this.windDirection,
    required this.visibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        color: AppTheme.kBgCard,
        borderRadius: BorderRadius.circular(AppTheme.rounded12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Temperature + altitude
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${temperature.toInt()}°',
                style: const TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.0,
                  fontFamily: 'Geist',
                ),
              ),
              const SizedBox(width: AppTheme.space4),
              Text(
                '/${altitude}m',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withValues(alpha: 0.45),
                  fontFamily: 'Geist',
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.space4),
          // Location
          Text(
            location,
            style: AppTheme.paragraphMedium.copyWith(color: Colors.white),
          ),
          const SizedBox(height: AppTheme.space12),
          // Divider
          Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
          const SizedBox(height: AppTheme.space12),
          // Wind + visibility
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.air_rounded, size: 16, color: Colors.white.withValues(alpha: 0.45)),
                  const SizedBox(width: AppTheme.space4),
                  Text(
                    '${windSpeed.toInt()}km/h, $windDirection',
                    style: AppTheme.paragraphSmRegular.copyWith(
                      color: Colors.white.withValues(alpha: 0.65),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.remove_red_eye_outlined, size: 16, color: Colors.white.withValues(alpha: 0.45)),
                  const SizedBox(width: AppTheme.space4),
                  Text(
                    '${visibility}Km',
                    style: AppTheme.paragraphSmRegular.copyWith(
                      color: Colors.white.withValues(alpha: 0.65),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}