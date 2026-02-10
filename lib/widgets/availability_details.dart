
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AvailabityDetails extends StatelessWidget {
  final int numberOfSpots;
  final String date;
  final String timeRange;
  const AvailabityDetails({
    required this.numberOfSpots,
    required this.timeRange,
    required this.date,
    super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(date,style: AppTheme.paragraphMedium,),
        Text(timeRange,style: AppTheme.paragraphSmRegular,),
        SizedBox(height: 10,),
        Text('$numberOfSpots spots available',style: AppTheme.paragraphSmRegular,)

      ],
    );
  }
}
