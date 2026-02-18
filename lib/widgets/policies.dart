import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'policy_item.dart';
class Policies extends StatelessWidget {

  const Policies({
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Things to know',
          style: AppTheme.heading3,
          ),
        SizedBox(height: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            PolicyItem(
              icon: Icons.car_rental_rounded, 
              policyTitle: 'Transportation', 
              policyDetail: 'If you need a ride, let your pilot know!'),
            SizedBox(height: 16,),
            PolicyItem(
              icon: Icons.calendar_month_rounded, 
              policyTitle: 'Cancellation policy', 
              policyDetail: 'Click to have a quick look on cancelation policy'
            ),
          ],
        ),
      ],
    );
  }
}