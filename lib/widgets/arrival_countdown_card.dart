import 'elevated_card.dart';
import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';


class ArrivalCountdownCard extends StatelessWidget {
  const ArrivalCountdownCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ARRIVING IN',
                      style: AppTheme.paragraphMiniMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppTheme.backgroundColor.withValues(alpha: 0.4)
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'See Map',
                          style: AppTheme.paragraphMiniRegular.copyWith(
                            color: AppTheme.backgroundColor.withValues(alpha: 0.6),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: AppTheme.space4,),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: AppTheme.backgroundColor.withValues(alpha: 0.6),
                          size: 16,
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '25',
                      style: AppTheme.kDisplayHero,
                    ),
                    SizedBox(width: AppTheme.space2,),
                    Text(
                      'min',
                      style: AppTheme.kDisplaySub,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Est arrival',
                      style: AppTheme.paragraphMiniRegular.copyWith(
                            color: AppTheme.backgroundColor.withValues(alpha: 0.4),
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    SizedBox(width: AppTheme.space2,),
                    Text(
                      '16:40',
                      style: AppTheme.paragraphMiniRegular.copyWith(
                            color: AppTheme.backgroundColor.withValues(alpha: 0.6),
                            fontWeight: FontWeight.w800,
                          ),
                    )
                  ],
                ),
              ],
    ));
  }
}