import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:atlas_paragliding/widgets/window_img.dart';
import 'package:atlas_paragliding/widgets/booking_header.dart';
import 'package:atlas_paragliding/widgets/booking_info.dart';
class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16,vertical: AppTheme.space16),
        child: Column(
          children: [
            BookingHeader(
              onShare: (){print('share');}, 
              onBack: ()=> Navigator.pop(context), 
              onLike: (){print('like');}),
            Expanded(child: WindowImg()),
            BookingInfo(
              title: 'Essential Flight With Hicham ', 
              subtitle: 'Pilot based in Marrakech, Morocco', 
              rating: 4.8, 
              years: 8, 
              flights: 516),
              

          ],
        )
        ),
    );
  }
  
}