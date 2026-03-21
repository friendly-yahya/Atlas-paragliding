import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/widgets/avatar.dart';

class GreetingTitle extends StatelessWidget {
  final String name;
  final bool isOnline;

  const GreetingTitle({
    super.key,
    required this.name,
    required this.isOnline,
  });

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning,';
    if (hour < 17) return 'Good afternoon,';
    return 'Good evening,';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _getGreeting(),
              style: AppTheme.paragraphMiniRegular.copyWith(
                color: Colors.white.withValues(alpha: .5),
                letterSpacing: 0.1,
              ),
            ),
            const SizedBox(height: AppTheme.space2),
            Text(
              name,
              style: AppTheme.heading3.copyWith(
                color: Colors.white,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
        const Spacer(),
        Avatar(name: name, isOnline: isOnline),
      ],
    );
  }
}