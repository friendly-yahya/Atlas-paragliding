import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';
class AccordionItem {
  final IconData icon;
  final String text;

  AccordionItem({
    required this.icon,
    required this.text,
  });
}
class ParaAccordion extends StatefulWidget {
  final List<AccordionItem> items;
  final String title;
  final bool initiallyExpanded;

  const ParaAccordion({
    super.key,
    required this.title,
    required this.items,
    this.initiallyExpanded = false,
    });

  @override
  State<ParaAccordion> createState() => _ParaAccordionState();
}

class _ParaAccordionState extends State<ParaAccordion> {
  late bool _isExpanded;
  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
              print(_isExpanded);
            });
          },
          child:Column(
            children: [
              Row(
                  children: [
                    Text(
                      "What this pack includes",
                      style: AppTheme.heading3,
                    ),
                    Spacer(),
                    Icon(
                      _isExpanded ? Icons.expand_less : Icons.expand_more,
                      size: 24,
                      color: AppTheme.textPrimary,
                    ),
                    
                  ],
                ),
                AnimatedContainer(
                      duration: Duration(milliseconds: 300), // animation speed
                      height: _isExpanded ? null : 0,      
                      padding: _isExpanded ? EdgeInsets.only(bottom: 4) : EdgeInsets.zero,
                      child: _isExpanded 
                        ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: widget.items.map((item){

                            return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(item.icon, size: 24,color: AppTheme.textPrimary,),
                                title: Text(item.text, style: AppTheme.paragraphSmMedium,),
                              );
                          }).toList(),
                            
                          
                        )
                        : SizedBox.shrink(), 
                ),
                SizedBox(height: 16), 
                Divider(
                  color: AppTheme.textSecondary.withValues(alpha: 0.3), // 
                  thickness: 1,
                  height: 1,
                )
            ],
          ),
          
        ),
      ],
    );
  }
}