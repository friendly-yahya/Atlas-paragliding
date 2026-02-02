import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ParaBulletAccordion extends StatefulWidget {
  final String title;
  final List<String> bulletPoints;
  final String? linkText;
  final VoidCallback? onLinkTap;
  final bool initiallyExpanded;

  const ParaBulletAccordion({
    super.key,
    required this.title,
    required this.bulletPoints,
    this.linkText,
    this.onLinkTap,
    this.initiallyExpanded = false,
  });

  @override
  State<ParaBulletAccordion> createState() => _ParaBulletAccordionState();
}

class _ParaBulletAccordionState extends State<ParaBulletAccordion> {
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
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: AppTheme.heading3,
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    size: 24,
                    color: AppTheme.textPrimary,
                  ),
                ],
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _isExpanded ? null : 0,
                child: _isExpanded
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12),
                          // Bullet points
                          ...widget.bulletPoints.map((point) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '• ',
                                    style: AppTheme.paragraphSmMedium,
                                  ),
                                  Expanded(
                                    child: Text(
                                      point,
                                      style: AppTheme.paragraphSmMedium,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          
                          // Optional link at the bottom
                          if (widget.linkText != null) ...[
                            SizedBox(height: 8),
                            GestureDetector(
                              onTap: widget.onLinkTap,
                              child: Row(
                                children: [
                                  Text(
                                    widget.linkText!,
                                    style: AppTheme.paragraphSmMedium.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 16,
                                    color: AppTheme.textPrimary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      )
                    : SizedBox.shrink(),
              ),
              SizedBox(height: 16),
              Divider(
                color: AppTheme.textSecondary.withValues(alpha: 0.3),
                thickness: 1,
                height: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}