import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';

class Avatar extends StatelessWidget {
  final String name;
  final bool isOnline;
  final String? imageUrl;
  final double size;

  const Avatar({
    super.key,
    required this.name,
    required this.isOnline,
    this.imageUrl,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    final dotSize = size * 0.23;       // scales with avatar
    final fontSize = size * 0.38;      // initial letter scales too

    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.primaryColor.withValues(alpha: 0.1),
            image: imageUrl != null
                ? DecorationImage(
                    image: NetworkImage(imageUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: imageUrl == null
              ? Center(
                  child: Text(
                    name[0].toUpperCase(),
                    style: AppTheme.paragraphMedium.copyWith(
                      color: AppTheme.primaryColor,
                      fontSize: fontSize,
                    ),
                  ),
                )
              : null,
        ),
        if (isOnline)
          Positioned(
            bottom: 1,
            right: 1,
            child: Container(
              width: dotSize,
              height: dotSize,
              decoration: BoxDecoration(
                color: AppTheme.successColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}