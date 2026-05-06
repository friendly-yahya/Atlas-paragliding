import '../../../core/widgets/elevated_card.dart';
import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return ElevatedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '31°',
                style: AppTheme.kDisplayHero(context),
              ),
              Text(
                '/1200m',
                style: AppTheme.kDisplaySub(context),
              )
            ],
          ),
          Text(
            'Ouirgane',
            style: AppTheme.kDisplaySub(context).copyWith(
              color: cs.surface.withValues(alpha: 0.8)
            ),
          ),
          const SizedBox(height: AppTheme.space24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.wb_cloudy_outlined,
                    color: cs.surface.withValues(alpha: 0.8),
                    size: 24,
                  ),
                  const SizedBox(width: AppTheme.space4),
                  Text(
                    '15km/h, W',
                    style: AppTheme.paragraphSmRegular.copyWith(
                      color: cs.surface.withValues(alpha: 0.8)
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.visibility_outlined,
                    color: cs.surface.withValues(alpha: 0.8),
                    size: 24,
                  ),
                  const SizedBox(width: AppTheme.space4),
                  Text(
                    '25Km',
                    style: AppTheme.paragraphSmRegular.copyWith(
                      color: cs.surface.withValues(alpha: 0.8)
                    ),
                  )
                ],
              )
            ],
          ) 
        ],
      ),
    );
  }
}