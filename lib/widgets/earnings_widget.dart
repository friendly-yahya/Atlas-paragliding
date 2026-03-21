import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';

class EarningsWidget extends StatelessWidget {
  const EarningsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        color: AppTheme.kPrimary,
        border: Border.all(
          color: AppTheme.backgroundColor.withValues(alpha: .1)
        ),
        borderRadius: BorderRadius.circular(AppTheme.space32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25), 
              offset: Offset(0, 4),                       
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
                  color: Colors.white.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w800,
                ),
              ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '\$250',
                style: AppTheme.kDisplayHero,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
      
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '5 flights',
                    style: AppTheme.paragraphSmRegular.copyWith(
                      color: AppTheme.backgroundColor.withValues(alpha: .7),
                      fontSize: 13,
                    )
                  ),
                  SizedBox(width: AppTheme.space6,),
                  Icon(
                    Icons.circle,
                    color: AppTheme.backgroundColor.withValues(alpha: 0.7),
                    size: 6,
                  ),
                  SizedBox(width: AppTheme.space6,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '4.8',
                        style: AppTheme.paragraphSmRegular.copyWith(
                          color: AppTheme.backgroundColor.withValues(alpha: .7),
                          fontSize: 13,
                        )
                      ),
                      SizedBox(width: AppTheme.space2,),
                      Icon(
                        Icons.star_rounded,
                        color: AppTheme.backgroundColor.withValues(alpha: 0.7),
                        size: 16,
                      ),

                    ],
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