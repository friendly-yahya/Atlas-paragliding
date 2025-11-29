import 'package:flutter/material.dart';
import 'package:atlas_paragliding/widgets/pilot_service_card.dart';
import 'package:atlas_paragliding/widgets/search_list_widget.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            const SearchListWidget(),
            const SizedBox(height: 16,),
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