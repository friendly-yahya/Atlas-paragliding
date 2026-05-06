import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';

const List<Map<String, String>> kFluencyLevels = [
  {'level': 'Beginner',     'desc': 'I know a few words',        'emoji': '🌱'},
  {'level': 'Intermediate', 'desc': 'I can hold a conversation', 'emoji': '📈'},
  {'level': 'Fluent',       'desc': 'I speak it comfortably',    'emoji': '⚡'},
  {'level': 'Native',       'desc': 'It\'s my first language',   'emoji': '🏆'},
];

class FluencyScreen extends StatefulWidget {
  const FluencyScreen({super.key, required this.language});
  final String language;

  @override
  State<FluencyScreen> createState() => _FluencyScreenState();
}

class _FluencyScreenState extends State<FluencyScreen> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ── Header ───────────────────────
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context), // pop with no result = cancelled
                    child: Container(
                      width: 40, height: 40,
                      decoration: BoxDecoration(color: cs.surfaceContainerHighest, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back_ios_new_rounded, color: cs.onSurface, size: 16),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(widget.language,
                      style: AppTheme.heading3.copyWith(color: cs.onSurface)),
                ],
              ),

              const SizedBox(height: 32),

              Text('What\'s your fluency level?',
                  style: AppTheme.heading2.copyWith(color: cs.onSurface)),
              const SizedBox(height: 8),
              Text(
                'This helps clients know how well you can communicate.',
                style: AppTheme.paragraphSmRegular.copyWith(color: cs.onSurfaceVariant),
              ),

              const SizedBox(height: 32),

              // ── Options ──────────────────────
              ...kFluencyLevels.map((f) {
                final isSelected = _selected == f['level'];
                return GestureDetector(
                  onTap: () => setState(() => _selected = f['level']),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? cs.primary : cs.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(AppTheme.rounded12),
                    ),
                    child: Row(
                      children: [
                        Text(f['emoji']!, style: const TextStyle(fontSize: 24)),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(f['level']!,
                                  style: AppTheme.paragraphMedium.copyWith(
                                    color: cs.onSurface,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Text(f['desc']!,
                                  style: AppTheme.paragraphSmRegular.copyWith(
                                    color: isSelected
                                        ? cs.onSurface.withValues(alpha: 0.7)
                                        : cs.onSurfaceVariant,
                                  )),
                            ],
                          ),
                        ),
                        if (isSelected)
                          const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
                      ],
                    ),
                  ),
                );
              }),

              const Spacer(),

              // ── Confirm ──────────────────────
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selected == null
                      ? null
                      // pop WITH the selected fluency string back to LanguagesScreen
                      : () => Navigator.pop(context, _selected),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cs.primary,
                    disabledBackgroundColor: cs.surfaceContainerHighest,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppTheme.rounded40),
                    ),
                    elevation: 0,
                  ),
                  child: Text('Confirm',
                      style: AppTheme.paragraphMedium.copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}