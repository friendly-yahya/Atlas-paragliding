import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/client/booking/booking_detail_screen.dart';
import 'package:flutter/material.dart';

class PilotServiceCard extends StatelessWidget {
  const PilotServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        border: Border.all(color: cs.outline, width: 1),
        borderRadius: BorderRadius.circular(AppTheme.rounded12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left — image + stats
          Padding(
            padding: const EdgeInsets.all(AppTheme.space12),
            child: SizedBox(
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppTheme.rounded8),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        'assets/images/hicham.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppTheme.space8),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, size: 14, color: AppTheme.starColor),
                      const SizedBox(width: 2),
                      Text('4.9', style: AppTheme.micro),
                      const SizedBox(width: 4),
                      Icon(Icons.circle, size: 3, color: cs.onSurfaceVariant),
                      const SizedBox(width: 4),
                      Text('150 flights', style: AppTheme.micro.copyWith(color: cs.onSurfaceVariant)),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.verified_rounded, size: 12, color: cs.primary),
                      const SizedBox(width: 3),
                      Text(
                        'Certified',
                        style: AppTheme.micro.copyWith(color: cs.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Divider
          Container(
            width: 1,
            margin: const EdgeInsets.symmetric(vertical: AppTheme.space12),
            color: cs.outline,
          ),

          // Right — info + actions
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.space12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name + like
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hicham L.', style: AppTheme.heading4),
                          Text(
                            'Marrakech, Morocco',
                            style: AppTheme.micro.copyWith(color: cs.onSurfaceVariant),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.favorite_border, size: 20, color: cs.onSurfaceVariant),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppTheme.space12),

                  // Price row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$85', style: AppTheme.heading3),
                      const SizedBox(width: 2),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          '/Essential Flight',
                          style: AppTheme.micro.copyWith(color: cs.onSurfaceVariant),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppTheme.space12),

                  // Book button
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const BookingDetailScreen()),
                        );
                      },
                      style: AppTheme.primaryButton(context),
                      child: const Text('Book Flight Now'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}