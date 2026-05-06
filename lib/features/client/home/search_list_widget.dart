import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:atlas_paragliding/core/theme/app_theme.dart';


class SearchListWidget extends StatefulWidget {
  const SearchListWidget({super.key});

  @override
  State<SearchListWidget> createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredItems = [];
  final List<String> _allItems = [
    'Moad',
    'Hicham',
    'Abdnour',
    'Badr',
  ];

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(_allItems);
    _searchController.addListener(() {
      setState(() {
        _filterItems(_searchController.text);
      });
    });
  }

  void _filterItems(String query) {
    if (query.isEmpty) {
      _filteredItems = List.from(_allItems);
    } else {
      _filteredItems = _allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      children: [
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Find your pilot',
            hintStyle: AppTheme.paragraphSmMedium.copyWith(
              color: cs.onSurfaceVariant,
            ),
            prefixIcon: Icon(Icons.search, color: cs.onSurfaceVariant),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.close_rounded, color: cs.onSurfaceVariant),
                    onPressed: () {
                      _searchController.clear();
                      _filterItems('');
                      setState(() {});
                      FocusScope.of(context).unfocus();
                    },
                  )
                : null,
            filled: true,
            fillColor: cs.surfaceContainerHighest,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppTheme.space16,
              vertical: AppTheme.space16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
              borderSide: BorderSide(color: cs.outline, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
              borderSide: BorderSide(color: cs.outline, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
              borderSide: BorderSide(color: cs.primary, width: 1.5),
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (_searchController.text.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              color: cs.surfaceContainerHighest,
              border: Border.all(color: cs.outline, width: 1),
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
            ),
            child: ListView.builder(
              itemCount: _filteredItems.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: index < _filteredItems.length - 1
                        ? Border(
                            bottom: BorderSide(color: cs.outline, width: 1),
                          )
                        : null,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.space12,
                      vertical: AppTheme.space4,
                    ),
                    title: Text(
                      _filteredItems[index],
                      style: AppTheme.paragraphSmRegular.copyWith(
                        color: cs.onSurface,
                      ),
                    ),
                    onTap: () {
                      _searchController.text = _filteredItems[index];
                      FocusScope.of(context).unfocus();
                    },
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}