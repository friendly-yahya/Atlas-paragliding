import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/screens/review_and_continue.dart';

class SafetyHealthCheck extends StatefulWidget {
  const SafetyHealthCheck({super.key});

  @override
  State<SafetyHealthCheck> createState() => _SafetyHealthCheckState();
}

class _SafetyHealthCheckState extends State<SafetyHealthCheck> {
  int age = 25;
  int weight = 60;
  bool? hasFlownBefore;

  final List<String> conditions = [
    'Heart conditions',
    'High/low blood pressure',
    'Recent surgery (6 months)',
    'Pregnancy',
    'None of the above',
  ];
  final List<IconData> conditionIcons = [
    Icons.favorite_border,
    Icons.monitor_heart_outlined,
    Icons.local_hospital_outlined,
    Icons.pregnant_woman_outlined,
    Icons.check,
  ];

  final List<String> heightFeelings = [
    'Love them! Bring on the thrills',
    'Comfortable and excited',
    'A bit nervous but ready',
    'Very anxious about heights',
  ];

  final List<String> selectedConditions = [];
  String? selectedHeightFeeling;
  bool acceptedTerms = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
                    Text('Safety & health check', style: AppTheme.heading2),
                    const SizedBox(height: AppTheme.space8),
                    Text(
                      'A few quick questions to ensure your safety during the flight. This will take about 2 minutes',
                      style: AppTheme.paragraphSmRegular.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space24),

                    Text('Tell us about yourself', style: AppTheme.heading3),
                    const SizedBox(height: AppTheme.space16),

                    // Age + Weight + Flown before card
                    _buildCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Age
                          _buildStepperRow(
                            label: 'How old are you?',
                            hint: 'eg: 25',
                            value: age,
                            onDecrement: () => setState(() { if (age > 1) age--; }),
                            onIncrement: () => setState(() => age++),
                          ),
                          const Divider(color: AppTheme.strokeColor),
                          // Weight
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildStepperRow(
                                label: 'How much do you weight',
                                hint: 'eg: 60',
                                value: weight,
                                onDecrement: () => setState(() { if (weight > 1) weight--; }),
                                onIncrement: () => setState(() => weight++),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Text('🟡', style: TextStyle(fontSize: 12)),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Safe range: 40-110Kg',
                                    style: AppTheme.paragraphMiniRegular.copyWith(
                                      color: AppTheme.textSecondary,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(color: AppTheme.strokeColor),
                          // Flown before
                          Text('Have you been paragliding before?', style: AppTheme.paragraphSmMedium),
                          const SizedBox(height: AppTheme.space8),
                          Row(
                            children: [
                              _buildToggle('Yes', hasFlownBefore == true, () {
                                setState(() => hasFlownBefore = true);
                              }),
                              const SizedBox(width: AppTheme.space8),
                              _buildToggle('No', hasFlownBefore == false, () {
                                setState(() => hasFlownBefore = false);
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Medical conditions card
                    _buildCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Do any of these apply to you?', style: AppTheme.paragraphSmMedium),
                          Text(
                            'Select all that apply',
                            style: AppTheme.paragraphMiniRegular.copyWith(color: AppTheme.textSecondary),
                          ),
                          const SizedBox(height: AppTheme.space12),
                          ...List.generate(conditions.length, (i) {
                            final condition = conditions[i];
                            final isSelected = selectedConditions.contains(condition);
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    selectedConditions.remove(condition);
                                  } else {
                                    selectedConditions.add(condition);
                                  }
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: AppTheme.space8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppTheme.space16,
                                  vertical: AppTheme.space12,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isSelected ? AppTheme.primaryColor : AppTheme.strokeColor,
                                  ),
                                  borderRadius: BorderRadius.circular(AppTheme.rounded8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(conditionIcons[i], size: 20, color: AppTheme.textSecondary),
                                    const SizedBox(width: AppTheme.space12),
                                    Text(condition, style: AppTheme.paragraphSmRegular),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Emergency contact card
                    _buildCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Emergency Contact', style: AppTheme.paragraphSmMedium),
                              const SizedBox(width: AppTheme.space4),
                              Text(
                                '(optional)',
                                style: AppTheme.paragraphMiniRegular.copyWith(color: AppTheme.textSecondary),
                              ),
                            ],
                          ),
                          const Divider(color: AppTheme.strokeColor),
                          _buildContactRow('Name:', 'Fatima Alaoui', nameController),
                          const Divider(color: AppTheme.strokeColor),
                          _buildContactRow('Phone:', '0627399949', phoneController),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Heights comfort card
                    _buildCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('How do you feel about heights?', style: AppTheme.paragraphSmMedium),
                          Text(
                            'Your comfort level helps Hicham prepare the best experience for you',
                            style: AppTheme.paragraphMiniRegular.copyWith(color: AppTheme.textSecondary),
                          ),
                          const SizedBox(height: AppTheme.space12),
                          ...heightFeelings.map((feeling) {
                            final isSelected = selectedHeightFeeling == feeling;
                            return GestureDetector(
                              onTap: () => setState(() => selectedHeightFeeling = feeling),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: AppTheme.space8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppTheme.space16,
                                  vertical: AppTheme.space12,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isSelected ? AppTheme.primaryColor : AppTheme.strokeColor,
                                  ),
                                  borderRadius: BorderRadius.circular(AppTheme.rounded8),
                                ),
                                child: Row(
                                  children: [
                                    const Text('😊', style: TextStyle(fontSize: 18)),
                                    const SizedBox(width: AppTheme.space12),
                                    Text(feeling, style: AppTheme.paragraphSmRegular),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Terms
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => acceptedTerms = !acceptedTerms),
                          child: Icon(
                            acceptedTerms ? Icons.check_box : Icons.check_box_outline_blank,
                            size: 20,
                            color: acceptedTerms ? AppTheme.primaryColor : AppTheme.textSecondary,
                          ),
                        ),
                        const SizedBox(width: AppTheme.space8),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: AppTheme.paragraphSmRegular,
                              children: [
                                const TextSpan(text: 'I understand '),
                                TextSpan(
                                  text: 'the risks',
                                  style: AppTheme.paragraphSmRegular.copyWith(
                                    color: AppTheme.primaryColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppTheme.primaryColor,
                                  ),
                                ),
                                const TextSpan(text: '  '),
                                TextSpan(
                                  text: 'and accept the terms and conditions',
                                  style: AppTheme.paragraphSmRegular.copyWith(
                                    color: AppTheme.primaryColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppTheme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space12),

                    // Message pilot
                    Row(
                      children: [
                        Text('Need to discuss something?', style: AppTheme.paragraphSmRegular),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Message Hicham directly',
                          style: AppTheme.paragraphSmMedium.copyWith(
                            color: AppTheme.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppTheme.primaryColor,
                          ),
                        ),
                        const SizedBox(width: AppTheme.space4),
                        const Text('💬', style: TextStyle(fontSize: 16)),
                      ],
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
                  MaterialPageRoute(builder: (_) => const ReviewAndContinue()),
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

  Widget _buildStepperRow({
    required String label,
    required String hint,
    required int value,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.space8),
      child: Row(
        children: [
          Expanded(child: Text(label, style: AppTheme.paragraphSmMedium)),
          GestureDetector(
            onTap: onDecrement,
            child: const Icon(Icons.remove, size: 20),
          ),
          const SizedBox(width: AppTheme.space8),
          Text('$value', style: AppTheme.paragraphSmRegular),
          const SizedBox(width: AppTheme.space8),
          GestureDetector(
            onTap: onIncrement,
            child: const Icon(Icons.add, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildToggle(String label, bool selected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppTheme.space12),
          decoration: BoxDecoration(
            border: Border.all(
              color: selected ? AppTheme.primaryColor : AppTheme.strokeColor,
            ),
            borderRadius: BorderRadius.circular(AppTheme.rounded8),
          ),
          child: Center(
            child: Text(
              label,
              style: AppTheme.paragraphSmMedium.copyWith(
                color: selected ? AppTheme.primaryColor : AppTheme.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactRow(String label, String placeholder, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.space8),
      child: Row(
        children: [
          Text(label, style: AppTheme.paragraphSmMedium),
          const SizedBox(width: AppTheme.space16),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: AppTheme.paragraphSmRegular.copyWith(color: AppTheme.textSecondary),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: AppTheme.paragraphSmRegular,
            ),
          ),
        ],
      ),
    );
  }
}