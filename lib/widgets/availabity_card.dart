import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/widgets/availability_details.dart';
class AvailabityCard extends StatelessWidget {
  const AvailabityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 240,

            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: AppTheme.textPrimary.withValues(alpha: 0.1),
                offset: const Offset(0, 1),
                blurRadius: 3,
                spreadRadius: 0 ,
              ),],
              borderRadius: BorderRadius.circular(AppTheme.space12),
              border: Border.all(
                color: AppTheme.strokeColor,
                width: 1,  
                              
              )
            ),
            child: AvailabityDetails(numberOfSpots: 8, timeRange: "2:30 - 6:30 PM", date: "Tomorrow, October 19")
          );
        },
      ),
    );
  }
}