import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/client/booking/policies.dart';
import 'package:flutter/material.dart';
import 'package:atlas_paragliding/features/client/booking/window_img.dart';
import 'package:atlas_paragliding/features/client/booking/booking_header.dart';
import 'package:atlas_paragliding/features/client/booking/about_info.dart';
import 'package:atlas_paragliding/features/client/booking/booking_info.dart';
import 'package:atlas_paragliding/features/client/booking/para_accordion.dart';
import 'package:atlas_paragliding/features/client/booking/para_bullet_accordion.dart';
import 'package:atlas_paragliding/core/widgets/reviews.dart';
import 'package:atlas_paragliding/features/client/booking/availabity_card.dart';
import 'package:atlas_paragliding/features/client/booking/meeting_spot_map.dart';
import 'package:atlas_paragliding/features/client/booking/booking_footer.dart';

class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: cs.surface,
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
              
                      const BookingInfo(
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
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                '4.8',
                                style: AppTheme.heading3.copyWith(color: cs.onSurface),
                              ),
                              const Icon(Icons.star_rounded, color: AppTheme.starColor, size: 26),
                            ],
                          ),
                          const SizedBox(width: 6),
                          Icon(Icons.circle, size: 8, color: cs.onSurfaceVariant),
                          const SizedBox(width: 8),
                          Text('127 reviews', style: AppTheme.heading3.copyWith(color: cs.onSurface)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Reviews(),
                      
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () => print("works fine"), 
                          style: AppTheme.primaryButton(context),
                          child: const Text('View all reviews'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Check availability',
                        style: AppTheme.heading3.copyWith(color: cs.onSurface),
                      ),
                      const SizedBox(height: 16),    
                      const AvailabityCard(),
                      const SizedBox(height: 16),
                      Divider(
                        color: cs.onSurfaceVariant.withValues(alpha: 0.3),
                        thickness: 1,
                        height: 1,
                      ),
                      const SizedBox(height: 16),

                      const MeetingSpotMap(longitude: 31.6295, latitude: -7.9811),

                      const SizedBox(height: 16),
                      const Policies(),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
            const BookingFooter(),
          ],
        ),
      ),
    );
  }
}