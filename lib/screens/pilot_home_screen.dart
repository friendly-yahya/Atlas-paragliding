import 'package:flutter/material.dart';
import 'package:atlas_paragliding/widgets/greeting_title.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
class PilotHomeScreen extends StatelessWidget {
  const PilotHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.kBgDeep,
      body: CustomScrollView( 
        slivers: [
          SliverAppBar(
            backgroundColor: AppTheme.kBgDeep,
            floating: true,
            snap: true,
            elevation: 0,
            titleSpacing: 20,
            title: GreetingTitle(name: "Mouad khouya", isOnline: true),
          ),
        ],
      ),
    );
  }
}