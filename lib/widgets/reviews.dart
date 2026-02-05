import 'package:flutter/material.dart';
//import 'package:atlas_paragliding/theme/app_theme.dart';


class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.2)
            ),
            child: Center(child: Text("Card ${index + 1}")),
          );
        },
      ),
    );
  }
}