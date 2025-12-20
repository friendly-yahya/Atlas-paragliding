import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:atlas_paragliding/widgets/window_img.dart';
class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16,vertical: AppTheme.space16),
        child: Column(
          children: [
            Expanded(child: WindowImg()),
          ],
        )
        ),
    );
  }
  
}