// ignore: unused_import
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:atlas_paragliding/features/client/home/booking/review_details.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
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
                color: cs.primary,
                width: 1.0,
              ))
            ),
            child: ReviewDetails(),
          );
        },
      ),
    );
  }
}