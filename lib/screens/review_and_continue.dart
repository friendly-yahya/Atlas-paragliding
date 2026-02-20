import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/screens/add_payment_method.dart';

class ReviewAndContinue extends StatelessWidget {
  const ReviewAndContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Exit button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.space16,
                vertical: AppTheme.space16,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.textPrimary,
                    foregroundColor: AppTheme.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppTheme.rounded8),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.space16,
                      vertical: AppTheme.space8,
                    ),
                  ),
                  child: const Text('Exit'),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Review and continue', style: AppTheme.heading2),
                    const SizedBox(height: AppTheme.space16),

                    // Main info card
                    _buildCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Pilot summary row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(AppTheme.rounded8),
                                child: Container(
                                  width: 90,
                                  height: 90,
                                  color: AppTheme.strokeColor,
                                  child: const Icon(Icons.paragliding, size: 40, color: AppTheme.textSecondary),
                                ),
                              ),
                              const SizedBox(width: AppTheme.space16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Essential Flight With Hicham',
                                      style: AppTheme.paragraphMedium,
                                    ),
                                    const SizedBox(height: AppTheme.space4),
                                    Row(
                                      children: [
                                        const Icon(Icons.star_rounded, color: AppTheme.starColor, size: 16),
                                        const SizedBox(width: 4),
                                        Text('4.8', style: AppTheme.paragraphSmMedium),
                                        Text(' • ', style: AppTheme.paragraphSmRegular.copyWith(color: AppTheme.textSecondary)),
                                        Text('127 reviews', style: AppTheme.paragraphSmRegular.copyWith(color: AppTheme.textSecondary)),
                                      ],
                                    ),
                                    const SizedBox(height: AppTheme.space4),
                                    Text(
                                      'Certified • Marrakech',
                                      style: AppTheme.paragraphSmRegular.copyWith(color: AppTheme.textSecondary),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: AppTheme.space16),
                          const Divider(color: AppTheme.strokeColor, height: 1),
                          const SizedBox(height: AppTheme.space16),

                          // Activity information
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Activity Information:', style: AppTheme.paragraphSmMedium),
                                    const SizedBox(height: AppTheme.space8),
                                    Text('Group size: 1 adult', style: AppTheme.paragraphSmRegular),
                                    Text('Date: Oct 19, 10:00 AM', style: AppTheme.paragraphSmRegular),
                                    Text('Flight : 1', style: AppTheme.paragraphSmRegular),
                                    Text('Flight duration: 15 min Tandem flight', style: AppTheme.paragraphSmRegular),
                                    Text('Location: Aguergour', style: AppTheme.paragraphSmRegular),
                                  ],
                                ),
                              ),
                              _buildChangeButton(context),
                            ],
                          ),

                          const SizedBox(height: AppTheme.space16),
                          const Divider(color: AppTheme.strokeColor, height: 1),
                          const SizedBox(height: AppTheme.space16),

                          // Passenger information
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Passenger Information:', style: AppTheme.paragraphSmMedium),
                                    const SizedBox(height: AppTheme.space8),
                                    Text('Name: friendly yahya', style: AppTheme.paragraphSmRegular),
                                    Text('phone: 0657582894', style: AppTheme.paragraphSmRegular),
                                  ],
                                ),
                              ),
                              _buildChangeButton(context),
                            ],
                          ),

                          const SizedBox(height: AppTheme.space16),
                          const Divider(color: AppTheme.strokeColor, height: 1),
                          const SizedBox(height: AppTheme.space16),

                          // Free cancellation
                          Text('Free cancellation', style: AppTheme.paragraphSmMedium),
                          const SizedBox(height: AppTheme.space4),
                          Text(
                            'Cancel before Oct 18 for a full refund. Full policy',
                            style: AppTheme.paragraphSmRegular.copyWith(color: AppTheme.textSecondary),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Pricing summary
                    Text('Pricing Summary', style: AppTheme.heading3),
                    const SizedBox(height: AppTheme.space16),

                    _buildCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Flight costs:', style: AppTheme.paragraphSmMedium),
                          const SizedBox(height: AppTheme.space8),
                          Text('Base price: MAD850', style: AppTheme.paragraphSmRegular),
                          Text('Insurance: Included', style: AppTheme.paragraphSmRegular),
                          Text('Video Recording: Included', style: AppTheme.paragraphSmRegular),
                          Text('Tea pause: Included', style: AppTheme.paragraphSmRegular),
                          const SizedBox(height: AppTheme.space12),
                          const Divider(color: AppTheme.strokeColor, height: 1),
                          const SizedBox(height: AppTheme.space12),
                          Text(
                            'Total price: \$80 (TAX INCLUDED)',
                            style: AppTheme.paragraphSmMedium,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space48),
                  ],
                ),
              ),
            ),

            // Next button
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.space16,
                vertical: AppTheme.space16,
              ),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppTheme.strokeColor)),
                color: AppTheme.backgroundColor,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddPaymentMethod()),
                ),
                  style: AppTheme.bookMainButtonLight,
                  child: const Text('Next'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.strokeColor),
        borderRadius: BorderRadius.circular(AppTheme.rounded12),
      ),
      child: child,
    );
  }

  Widget _buildChangeButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.backgroundColor,
        foregroundColor: AppTheme.textPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.rounded8),
          side: const BorderSide(color: AppTheme.strokeColor),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.space16,
          vertical: AppTheme.space8,
        ),
      ),
      child: const Text('Change'),
    );
  }
}