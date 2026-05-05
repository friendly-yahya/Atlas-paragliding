import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/pilot/profile/language_set_up/fluency_screen.dart';

const List<Map<String, String>> kLanguages = [
  {'name': 'English',    'flag': '🇬🇧'},
  {'name': 'French',     'flag': '🇫🇷'},
  {'name': 'Arabic',     'flag': '🇲🇦'},
  {'name': 'Spanish',    'flag': '🇪🇸'},
  {'name': 'German',     'flag': '🇩🇪'},
  {'name': 'Italian',    'flag': '🇮🇹'},
  {'name': 'Portuguese', 'flag': '🇵🇹'},
  {'name': 'Dutch',      'flag': '🇳🇱'},
  {'name': 'Russian',    'flag': '🇷🇺'},
  {'name': 'Japanese',   'flag': '🇯🇵'},
  {'name': 'Chinese',    'flag': '🇨🇳'},
  {'name': 'Tamazight',  'flag': '🏔️'},
];

// What gets passed back to the profile
class SelectedLanguage {
  const SelectedLanguage({required this.name, required this.flag, required this.fluency});
  final String name;
  final String flag;
  final String fluency;
}

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key, required this.selected});
  final List<SelectedLanguage> selected;

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  String _search = '';
  late List<SelectedLanguage> _selected;

  @override
  void initState() {
    super.initState();
    _selected = List.from(widget.selected);
  }

  bool _isPicked(String name) => _selected.any((l) => l.name == name);

  void _remove(String name) {
    setState(() => _selected.removeWhere((l) => l.name == name));
  }

  @override
  Widget build(BuildContext context) {
    final filtered = kLanguages
        .where((l) => l['name']!.toLowerCase().contains(_search.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: AppTheme.kBgDeep,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Header ─────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context, _selected),
                    child: Container(
                      width: 40, height: 40,
                      decoration: BoxDecoration(color: AppTheme.kBgCard, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back_ios_new_rounded, color: AppTheme.kTextPrimary, size: 16),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text('Languages Spoken',
                      style: AppTheme.heading3.copyWith(color: AppTheme.kTextPrimary)),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Already picked chips ────────────
            if (_selected.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _selected.map((l) => _LanguageChip(
                    lang: l,
                    onRemove: () => _remove(l.name),
                  )).toList(),
                ),
              ),

            const SizedBox(height: 16),

            // ── Search ─────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.kBgCard,
                  borderRadius: BorderRadius.circular(AppTheme.rounded12),
                ),
                child: TextField(
                  onChanged: (v) => setState(() => _search = v),
                  style: AppTheme.paragraphSmRegular.copyWith(color: AppTheme.kTextPrimary),
                  decoration: InputDecoration(
                    hintText: 'Search language...',
                    hintStyle: AppTheme.paragraphSmRegular.copyWith(color: AppTheme.kTextSecondary),
                    prefixIcon: Icon(Icons.search_rounded, color: AppTheme.kTextSecondary, size: 20),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ── List ───────────────────────────
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, i) {
                  final lang = filtered[i];
                  final picked = _isPicked(lang['name']!);

                  return GestureDetector(
                    onTap: picked
                        ? null
                        : () async {
                            final fluency = await Navigator.push<String>(
                              context,
                              MaterialPageRoute(
                                builder: (_) => FluencyScreen(language: lang['name']!),
                              ),
                            );
                            if (fluency != null) {
                              setState(() => _selected.add(SelectedLanguage(
                                name: lang['name']!,
                                flag: lang['flag']!,
                                fluency: fluency,
                              )));
                            }
                          },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: picked ? AppTheme.kBgElevated : AppTheme.kBgCard,
                        borderRadius: BorderRadius.circular(AppTheme.rounded12),
                        border: Border.all(
                          color: picked ? AppTheme.kPrimary.withValues(alpha: 0.4) : Colors.transparent,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(lang['flag']!, style: const TextStyle(fontSize: 24)),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              lang['name']!,
                              style: AppTheme.paragraphMedium.copyWith(
                                color: picked ? AppTheme.kTextSecondary : AppTheme.kTextPrimary,
                              ),
                            ),
                          ),
                          if (picked)
                            Icon(Icons.check_circle_rounded, color: AppTheme.kPrimary, size: 20)
                          else
                            Icon(Icons.chevron_right_rounded, color: AppTheme.kTextSecondary, size: 20),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Chip showing picked language + fluency ──────────────────
class _LanguageChip extends StatelessWidget {
  const _LanguageChip({required this.lang, required this.onRemove});
  final SelectedLanguage lang;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.kPrimary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppTheme.kPrimary.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(lang.flag, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 6),
          Text(
            '${lang.name} · ${lang.fluency}',
            style: AppTheme.paragraphMiniMedium.copyWith(color: AppTheme.kPrimary),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onRemove,
            child: Icon(Icons.close_rounded, color: AppTheme.kPrimary, size: 14),
          ),
        ],
      ),
    );
  }
}