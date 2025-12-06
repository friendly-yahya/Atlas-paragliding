import 'package:atlas_paragliding/main_screen.dart';
import 'package:flutter/material.dart';
//import 'widgets/pilot_service_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atlas Paragliding',
      theme: AppTheme.lightTheme,
      home: const MainScreen(), 
    );
  }
}