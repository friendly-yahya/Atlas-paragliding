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
          decoration: const InputDecoration(
            hintText: 'Find your pilot',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 16),

        ListView.builder(
          
          itemCount: _filteredItems.length,
          shrinkWrap: true,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(_filteredItems[index]),
            );
          },
        ) ,
          
       
      ],
    );
    
  }
}