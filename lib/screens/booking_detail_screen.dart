import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:atlas_paragliding/widgets/window_img.dart';
import 'package:atlas_paragliding/widgets/booking_header.dart';
import 'package:atlas_paragliding/widgets/about_info.dart';
import 'package:atlas_paragliding/widgets/booking_info.dart';
import 'package:atlas_paragliding/widgets/para_accordion.dart';
class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.space16,
                    vertical: AppTheme.space16,
                  ),
              child: BookingHeader(
                          onShare: () => print('share'),
                          onBack: () => Navigator.pop(context),
                          onLike: () => print('like'),
                        ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.space16,
                    vertical: AppTheme.space16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      const SizedBox(height: 16),
                      const WindowImg(),
                      const SizedBox(height: 16),
              
                      BookingInfo(
                        title: 'Essential Flight With Hicham ',
                        subtitle: 'Pilot based in Marrakech, Morocco',
                        rating: 4.8,
                        years: 8,
                        flights: 516,
                      ),
                      const SizedBox(height: 16),
              
                      const AboutInfo(),
                      const SizedBox(height: 16),
              
                      const ParaAccordion(),
              
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
