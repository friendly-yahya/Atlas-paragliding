import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';

class Avatar extends StatelessWidget {
  final String name;
  final bool isOnline;
  final String? imageUrl;

  const Avatar({
    super.key,
    required this.name,
    required this.isOnline,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 48,
          height: 48,
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
              width: 11,
              height: 11,
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