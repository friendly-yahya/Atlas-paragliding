import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/client/payement/add_card_details.dart';

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
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: cs.surface,
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
                    backgroundColor: cs.primary,
                    foregroundColor: cs.surface,
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
                        border: Border.all(color: cs.outline),
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
                                      Icon(method['icon'] as IconData, size: 22, color: cs.primary),
                                      const SizedBox(width: AppTheme.space12),
                                      Expanded(
                                        child: Text(
                                          method['label'] as String,
                                          style: AppTheme.paragraphSmRegular.copyWith(color: cs.onSurface),
                                        ),
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: isSelected ? cs.primary : cs.outline,
                                            width: isSelected ? 6 : 1.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (!isLast) Divider(height: 1, color: cs.outline),
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
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: cs.outline)),
                color: cs.surface,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => showAddCardDetails(context),
                  style: AppTheme.pillButtonPrimary(context),
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