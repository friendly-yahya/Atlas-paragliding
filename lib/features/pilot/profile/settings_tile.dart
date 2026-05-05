import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.label,
    this.subtitle,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String? subtitle; // optional line below the label
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.kBgCard,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: AppTheme.kPrimary.withValues(alpha: 0.1),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppTheme.space16,
            vertical: AppTheme.space12,
          ),
          child: Row(
            children: [
              Icon(icon, color: AppTheme.kTextPrimary, size: 20),
              const SizedBox(width: AppTheme.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: AppTheme.paragraphMedium.copyWith(color: AppTheme.kTextPrimary)),
                    if (subtitle != null)
                      Text(subtitle!,
                          style: AppTheme.paragraphMiniRegular.copyWith(color: AppTheme.kTextSecondary)),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: AppTheme.kTextPrimary),
            ],
          ),
        ),
      ),
    );
  }
}