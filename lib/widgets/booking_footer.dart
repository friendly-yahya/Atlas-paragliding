import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/screens/safety_health_check.dart';
import 'package:flutter/material.dart';
class BookingFooter extends StatelessWidget {
  const BookingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('MAD800',style: AppTheme.heading3.copyWith(decoration: TextDecoration.underline),),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('for 1 solo tandem flight',style: AppTheme.paragraphSmMedium,),
                Text('Oct 19 - 10 am',style: AppTheme.paragraphSmMedium,)
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Free cancellation',style: AppTheme.paragraphSmMedium.copyWith(decoration: TextDecoration.underline,fontWeight: FontWeight.w600),),
                SizedBox(width: 8,),
                Icon(Icons.help_outline,size: 20,)
              ],
            )
          ],
        ),
        Spacer(),
        TextButton(
          onPressed: () => Navigator.push(
            context, 
            MaterialPageRoute(builder: (_) => const SafetyHealthCheck())),
          style: AppTheme.bookMainButtonLight,
          child: Text(
            'Book',
            ),
          )
      ],
    );
  }
}
