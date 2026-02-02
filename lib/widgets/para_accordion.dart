import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ParaAccordion extends StatefulWidget {
  const ParaAccordion({super.key});

  @override
  State<ParaAccordion> createState() => _ParaAccordionState();
}

class _ParaAccordionState extends State<ParaAccordion> {
  bool _isExpanded = false;
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
                          children: [
                            ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(Icons.camera_alt_outlined, size: 24,color: AppTheme.textPrimary,),
                                title: Text('Professional video recording', style: AppTheme.paragraphSmMedium,),
                              ),
                          ],
                        )
                        : SizedBox.shrink(), 
                        // empty when collapsed
                ),
                SizedBox(height: 16), // Space before divider
                Divider(
                  color: AppTheme.textSecondary.withValues(alpha: 0.3), // Customize color
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