import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:atlas_paragliding/widgets/round_icon_button.dart';

class BookingHeader extends StatelessWidget {
  final VoidCallback onShare;
  final VoidCallback onLike;
  final VoidCallback onBack;
  const BookingHeader({
    super.key,
    required this.onShare,
    required this.onBack,
    required this.onLike,
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        RoundIconButton(
          icon: Icons.arrow_back_ios_new_rounded, 
          onPressed: onBack
          ),
        Spacer(),
        RoundIconButton(
          icon: Icons.ios_share,
          onPressed: onShare
          ),
        SizedBox(
          width: AppTheme.space8,
        ),
        RoundIconButton(
          icon: Icons.favorite_border_rounded, 
          onPressed: onLike
        )
      ],
    );
  }
}