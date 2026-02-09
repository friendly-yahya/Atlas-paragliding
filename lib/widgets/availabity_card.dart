import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/widgets/availability_details.dart';
class AvailabityCard extends StatelessWidget {
  const AvailabityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 300,

            padding: EdgeInsets.only(right: 21),
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              border: Border(right: BorderSide(
                color: AppTheme.textPrimary,
                width: 1.0,
              ))
            ),
            child: AvailabityDetails(),
          );
        },
      ),
    );
  }
}