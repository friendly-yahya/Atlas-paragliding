import 'package:atlas_paragliding/features/client/client_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/pilot/pilot_main_screen.dart'; 

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
      home: const AppRoot(), 
    );
  }
}
class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  bool _isPilotMode = false;
  void _switchToPilot() => setState(()=> _isPilotMode = true);
    void _switchToClient() => setState(()=> _isPilotMode = false);
  @override
  Widget build(BuildContext context) {
    return _isPilotMode
        ? PilotMainScreen(onSwitchToClient: _switchToClient)
        :ClientMainScreen(onSwitchToPilot: _switchToPilot);
  }
}