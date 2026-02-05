import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:atlas_paragliding/widgets/window_img.dart';
import 'package:atlas_paragliding/widgets/booking_header.dart';
import 'package:atlas_paragliding/widgets/about_info.dart';
import 'package:atlas_paragliding/widgets/booking_info.dart';
import 'package:atlas_paragliding/widgets/para_accordion.dart';
import 'package:atlas_paragliding/widgets/para_bullet_accordion.dart';
import 'package:atlas_paragliding/widgets/reviews.dart';
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
              
                      ParaAccordion(title: "What this pack includes", items: [
                        AccordionItem(icon: Icons.camera_alt_outlined, text: 'Professional video recording'),
                        AccordionItem(icon: Icons.paragliding_outlined, text: 'Tandem paragliding flight (15 min)'),
                        AccordionItem(icon: Icons.shield_outlined, text: 'Insurance coverage'),
                        AccordionItem(icon: Icons.local_cafe_outlined, text: 'Traditional tea pause'),
                        AccordionItem(icon: Icons.photo_camera_outlined, text: 'Photos & memories')
                      ]),
                      const SizedBox(height: 16),
                      ParaBulletAccordion(
                        title: "Certifications & Safety",
                        bulletPoints: [
                          'FFVL Certified Instructor (French Federation)',
                          'IPPI Level 4 Pilot',
                          'First Aid Certified',
                          'Commercial Pilot License #MA-2018-0847',
                          'Fully insured flights',
                          'Safety equipment inspected monthly',
                        ],
                        linkText: 'Find out more about certifications & safety',
                        onLinkTap: () {
                          print('Navigate to certifications page');
                        },
                      ),
                      const SizedBox(height: 16),
                      ParaBulletAccordion(title: "Equipement", bulletPoints: [
                        'Ozone paraglider (2023 model)',
                        'GoPro video included',
                      ]),
                      const SizedBox(height: 32),
                      Reviews(),
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
 
