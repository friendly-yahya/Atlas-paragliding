import 'package:flutter/material.dart';
import 'package:atlas_paragliding/widgets/pilot_service_card.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return PilotServiceCard();
          },
        ),
      )
    );
    
  }
}