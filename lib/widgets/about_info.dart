import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AboutInfo extends StatelessWidget {
  const AboutInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Hicham",
          style: AppTheme.heading3,
        ),
        Text(
          "Born and raised in Marrakech! I've been flying these skies for 8 years and know all the best spots. Your safety is my priority - let's make some unforgettable memories together!",
          style: AppTheme.paragraphSmMedium,
        ),
        Text(
          "This host speaks English,  French, Dutch, German, Arabic, Spanish",
          style: AppTheme.paragraphSmRegular.copyWith(color: AppTheme.textSecondary),
        )
      ],
    );
  }
}