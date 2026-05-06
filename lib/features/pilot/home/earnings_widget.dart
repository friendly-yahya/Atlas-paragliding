import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';

class EarningsWidget extends StatelessWidget {
  const EarningsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return Container(
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        color: cs.primary,
        borderRadius: BorderRadius.circular(AppTheme.space32),
        boxShadow: [
          BoxShadow(
            color: cs.shadow.withValues(alpha: 0.25), 
            offset: const Offset(0, 4),                       
            blurRadius: 20,                             
            spreadRadius: 0,                             
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Today',
            style: AppTheme.paragraphSmRegular.copyWith(
              color: cs.onSurface.withValues(alpha: 0.8),
              fontWeight: FontWeight.w800,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '\$250',
                style: AppTheme.kDisplayHero(context),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '5 flights',
                    style: AppTheme.paragraphSmRegular.copyWith(
                      color: cs.onSurface.withValues(alpha: .7),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: AppTheme.space6),
                  Icon(
                    Icons.circle,
                    color: cs.onSurface.withValues(alpha: 0.7),
                    size: 6,
                  ),
                  const SizedBox(width: AppTheme.space6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '4.8',
                        style: AppTheme.paragraphSmRegular.copyWith(
                          color: cs.onSurface.withValues(alpha: .7),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: AppTheme.space2),
                      Icon(
                        Icons.star_rounded,
                        color: cs.onSurface.withValues(alpha: 0.7),
                        size: 16,
                      ),
                    ],
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