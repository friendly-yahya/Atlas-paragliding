import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';

class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({super.key});

  @override
  State<AddPaymentMethod> createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  String selectedMethod = 'Credit or debit card';

  final List<Map<String, dynamic>> paymentMethods = [
    {'label': 'Credit or debit card', 'icon': Icons.credit_card},
    {'label': 'PayPal', 'icon': Icons.paypal},
    {'label': 'Google Pay', 'icon': Icons.g_mobiledata},
    {'label': 'Apple Pay', 'icon': Icons.apple},
  ];

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Add a payment method', style: AppTheme.heading2),
                    const SizedBox(height: AppTheme.space24),

                    // Payment options card
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.strokeColor),
                        borderRadius: BorderRadius.circular(AppTheme.rounded12),
                      ),
                      child: Column(
                        children: List.generate(paymentMethods.length, (i) {
                          final method = paymentMethods[i];
                          final isSelected = selectedMethod == method['label'];
                          final isLast = i == paymentMethods.length - 1;

                          return GestureDetector(
                            onTap: () => setState(() => selectedMethod = method['label']),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppTheme.space16,
                                    vertical: AppTheme.space16,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(method['icon'] as IconData, size: 22, color: AppTheme.textPrimary),
                                      const SizedBox(width: AppTheme.space12),
                                      Expanded(
                                        child: Text(method['label'] as String, style: AppTheme.paragraphSmRegular),
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: isSelected ? AppTheme.primaryColor : AppTheme.strokeColor,
                                            width: isSelected ? 6 : 1.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (!isLast)
                                  const Divider(height: 1, color: AppTheme.strokeColor),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
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
                  onPressed: () {
                    // navigate to confirmation screen
                  },
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
}