import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';

class ElevatedCard extends StatelessWidget {
  final Column child;
  final EdgeInsetsGeometry? padding;
  final double? minHeight;
  final double? maxHeight;
  final double? width;
  const ElevatedCard({
    super.key,
    required this.child,
    this.padding,
    this.minHeight,
    this.maxHeight,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding ?? const EdgeInsets.all(AppTheme.space16),
      constraints: (minHeight != null || maxHeight != null)
          ? BoxConstraints(
              minHeight: minHeight ?? 0,
              maxHeight: maxHeight ?? double.infinity,
            )
          : null,
      decoration: BoxDecoration(
        color: AppTheme.kBgElevated,
        border: Border.all(
          color: AppTheme.backgroundColor.withValues(alpha: .1),
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
      child: child,
    );
  }
}