import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';

void showAddCardDetails(BuildContext context) {
  final cs = Theme.of(context).colorScheme;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: cs.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppTheme.rounded12)),
    ),
    builder: (_) => const _AddCardDetailsSheet(),
  );
}

class _AddCardDetailsSheet extends StatefulWidget {
  const _AddCardDetailsSheet();

  @override
  State<_AddCardDetailsSheet> createState() => _AddCardDetailsSheetState();
}

class _AddCardDetailsSheetState extends State<_AddCardDetailsSheet> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expirationController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  String selectedCountry = 'Morocco';

  final List<String> countries = [
    'Morocco',
    'France',
    'United States',
    'United Kingdom',
    'Germany',
    'Spain',
    'Italy',
    'Netherlands',
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(AppTheme.space24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 24),
                Text('Add card details', style: AppTheme.paragraphMedium),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, size: 24),
                ),
              ],
            ),

            const SizedBox(height: AppTheme.space24),

            // Card fields
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: cs.outline),
                borderRadius: BorderRadius.circular(AppTheme.rounded8),
              ),
              child: Column(
                children: [
                  // Card number
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.space16,
                      vertical: AppTheme.space4,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: cardNumberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Card number',
                              hintStyle: AppTheme.paragraphSmRegular.copyWith(
                                color: cs.onSurfaceVariant,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                            style: AppTheme.paragraphSmRegular.copyWith(color: cs.onSurface),
                          ),
                        ),
                        Icon(Icons.lock_outline, size: 18, color: cs.onSurfaceVariant),
                      ],
                    ),
                  ),
                  Divider(height: 1, color: cs.outline),
                  // Expiration + CVV
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppTheme.space16,
                              vertical: AppTheme.space4,
                            ),
                            child: TextField(
                              controller: expirationController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                hintText: 'Expiration',
                                hintStyle: AppTheme.paragraphSmRegular.copyWith(
                                  color: cs.onSurfaceVariant,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                              style: AppTheme.paragraphSmRegular.copyWith(color: cs.onSurface),
                            ),
                          ),
                        ),
                        VerticalDivider(width: 1, color: cs.outline),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppTheme.space16,
                              vertical: AppTheme.space4,
                            ),
                            child: TextField(
                              controller: cvvController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'CVV/CVC',
                                hintStyle: AppTheme.paragraphSmRegular.copyWith(
                                  color: cs.onSurfaceVariant,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                              style: AppTheme.paragraphSmRegular.copyWith(color: cs.onSurface),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.space16),

            // Country/region
            Text('Country/region', style: AppTheme.paragraphSmMedium),
            const SizedBox(height: AppTheme.space8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.space16,
                vertical: AppTheme.space4,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: cs.outline),
                borderRadius: BorderRadius.circular(AppTheme.rounded8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCountry,
                  isExpanded: true,
                  icon: Icon(Icons.keyboard_arrow_down, color: cs.primary),
                  style: AppTheme.paragraphSmRegular.copyWith(color: cs.onSurface),
                  onChanged: (value) {
                    if (value != null) setState(() => selectedCountry = value);
                  },
                  items: countries.map((country) {
                    return DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: AppTheme.space32),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cs.primary,
                    foregroundColor: cs.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppTheme.rounded40),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.space24,
                      vertical: AppTheme.space12,
                    ),
                  ),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: AppTheme.pillButtonPrimary(context),
                  child: const Text('Next'),
                ),
              ],
            ),

            const SizedBox(height: AppTheme.space8),
          ],
        ),
      ),
    );
  }
}