import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';



class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    });
  final IconData icon;
  final String label;
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
            vertical: AppTheme.space12
          ),
          child: Row(
            children: [
              Icon(icon,color: AppTheme.kTextPrimary, size: 20),
              const SizedBox(width: AppTheme.space12,),
              Expanded(
                child: Text(
                  label,
                  style: AppTheme.paragraphMedium.copyWith(color: AppTheme.kTextPrimary),
                )
              ),
              Icon(Icons.chevron_right_rounded, color: AppTheme.kTextPrimary,)
            ],
          ),
             ),
      ),
    );
  }
}