import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PolicyItem extends StatelessWidget {
  final IconData icon;
  final String policyTitle;
  final String policyDetail;

  const PolicyItem({
    required this.icon,
    required this.policyTitle,
    required this.policyDetail,
    super.key,

    });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 32,
        ),
        SizedBox(width: 16,),
        Expanded(
          
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(policyTitle,style: AppTheme.paragraphSmMedium.copyWith(fontWeight: FontWeight.w600),softWrap: true),
              SizedBox(height: 2,),
              Text(policyDetail,style: AppTheme.paragraphSmRegular.copyWith(fontWeight: FontWeight.w400,decoration: TextDecoration.underline),softWrap: true)
            ],
          ),
        ),
        SizedBox(width: 8,),
        Icon(Icons.chevron_right_rounded, size: 32,)
      ],
    );
  }
}