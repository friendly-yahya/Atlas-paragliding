import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:atlas_paragliding/theme/app_theme.dart';


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
        .where((item)=>
          item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    }
  }
  @override 
  void dispose(){
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Find your pilot',
            hintStyle: AppTheme.paragraphSmMedium.copyWith(color: AppTheme.textSecondary,),
            prefixIcon: Icon(Icons.search, color: AppTheme.textSecondary,),
            suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                icon: const Icon(Icons.close_rounded,color: AppTheme.textSecondary,),
                
                onPressed: () {
                  _searchController.clear();
                  _filterItems('');
                  setState(() {});
                  FocusScope.of(context).unfocus();
                },
              )
              : null,  
            filled: true,
            fillColor: AppTheme.searchBackgroundColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppTheme.space16,
              vertical: AppTheme.space16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
              borderSide: const BorderSide(
                color: AppTheme.strokeColor,
                width: 1,
              )
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
              borderSide: const BorderSide(
                color: AppTheme.strokeColor,
                width: 1,
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 1.5,
              )
            ),
          ),
        ),
        const SizedBox(height: 16),
        if(_searchController.text.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              color: AppTheme.searchBackgroundColor,
              border: Border.all(
                color: AppTheme.strokeColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
            ),
            child: ListView.builder(
          
              itemCount: _filteredItems.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  decoration: BoxDecoration(
                    border: index < _filteredItems.length - 1
                      ? const Border(
                        bottom: BorderSide(
                          color: AppTheme.strokeColor,
                          width: 1,
                        ),
                      )
                      : null,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.space12,
                      vertical: AppTheme.space4,
                    ),
                    title: Text(_filteredItems[index],
                    style: AppTheme.paragraphSmRegular,),
                    onTap: () {
                      _searchController.text = _filteredItems[index];
                      FocusScope.of(context).unfocus();
                    },
                  ),
                );
              },
            ) ,
          ),
        
          
       
      ],
    );
    
  }
}