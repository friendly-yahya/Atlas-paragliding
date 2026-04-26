import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/screens/fluency_screen.dart';

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

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  String _search = '';

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

            //Header 
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppTheme.kBgCard,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          color: AppTheme.kTextPrimary, size: 16),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text('Languages Spoken',
                      style: AppTheme.heading3.copyWith(color: AppTheme.kTextPrimary)),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Search
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

            //List 
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, i) {
                  final lang = filtered[i];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FluencyScreen(language: lang['name']!),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: AppTheme.kBgCard,
                        borderRadius: BorderRadius.circular(AppTheme.rounded12),
                      ),
                      child: Row(
                        children: [
                          Text(lang['flag']!, style: const TextStyle(fontSize: 24)),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              lang['name']!,
                              style: AppTheme.paragraphMedium.copyWith(color: AppTheme.kTextPrimary),
                            ),
                          ),
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