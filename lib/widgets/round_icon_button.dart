import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart'; 

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        borderRadius: BorderRadius.circular(AppTheme.space8),
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: Container(
            decoration: 
              BoxDecoration(
                color: AppTheme.strokeColor,
                shape: BoxShape.circle
              ),
            child: Padding(
              padding: EdgeInsets.all(AppTheme.space8),
              child: Icon(icon),
            ),
          ),
        ),
      ),
    );
  }
}
