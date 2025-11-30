import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:atlas_paragliding/widgets/pilot_service_card.dart';
import 'package:atlas_paragliding/widgets/search_list_widget.dart';
import 'package:atlas_paragliding/widgets/weather_header.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.space16,
                vertical: AppTheme.space8,
              ),
              child: WeatherHeader(),
            ),
            const SizedBox(height: AppTheme.space48,),
            const SearchListWidget(),
            const SizedBox(height: AppTheme.space48,),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return PilotServiceCard();
                },
              ),
            ),
          ],
        ),
      )
    );
    
  }
}