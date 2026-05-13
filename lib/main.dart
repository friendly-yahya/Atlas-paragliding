import 'package:atlas_paragliding/core/theme/notifiers.dart';
import 'package:atlas_paragliding/features/client/client_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/pilot/pilot_main_screen.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppRoot(); 
    
  }
}
class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  bool _isPilotMode = false;                                    // ← up here
  void _switchToPilot()  => setState(() => _isPilotMode = true);   // ← up here
  void _switchToClient() => setState(() => _isPilotMode = false);  // ← up here

  @override
  Widget build(BuildContext context) {
    return _isPilotMode
        ? _PilotApp(onSwitchToClient: _switchToClient)
        : _ClientApp(onSwitchToPilot: _switchToPilot);
  }
}
class _ClientApp extends ConsumerWidget {
  final VoidCallback onSwitchToPilot;
  const _ClientApp({required this.onSwitchToPilot});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(clientThemeProvider);
    return MaterialApp(
      theme:     AppTheme.clientLightTheme,
      darkTheme: AppTheme.clientDarkTheme,
      themeMode: themeMode,
      home: ClientMainScreen(onSwitchToPilot: onSwitchToPilot),
    );
  }
}

class _PilotApp extends ConsumerWidget {
  final VoidCallback onSwitchToClient;
  const _PilotApp({required this.onSwitchToClient});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(pilotThemeProvider);
    return MaterialApp(
      theme:     AppTheme.pilotLightTheme,
      darkTheme: AppTheme.pilotDarkTheme,
      themeMode: themeMode,
      home: PilotMainScreen(onSwitchToClient: onSwitchToClient),
    );
  }
}