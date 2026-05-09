import 'package:flutter/material.dart';
import 'package:atlas_paragliding/features/pilot/home/greeting_title.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/pilot/home/earnings_widget.dart';
import 'package:atlas_paragliding/features/pilot/home/messages_widget.dart';
import 'package:atlas_paragliding/features/pilot/home/weather_widget.dart';
import 'package:atlas_paragliding/features/pilot/home/arrival_countdown_card.dart';
import 'package:atlas_paragliding/features/pilot/home/client_info_card.dart';
import 'package:atlas_paragliding/features/pilot/home/flight_progress_slider.dart';

class PilotHomeScreen extends StatefulWidget {
  const PilotHomeScreen({super.key});

  @override
  State<PilotHomeScreen> createState() => _PilotHomeScreenState();
}

class _PilotHomeScreenState extends State<PilotHomeScreen> {
  
  double _progress = 0.4;
  
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        backgroundColor: cs.surface,
        elevation: 0,
        titleSpacing: AppTheme.space12,
        title: GreetingTitle(name: "Mouad khouya", isOnline: true),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.space8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppTheme.space8),
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest,
                border: Border.all(
                  color: cs.onSurface.withValues(alpha: .1),
                ),
                borderRadius: BorderRadius.circular(AppTheme.space32),
                boxShadow: [
                  BoxShadow(
                    color: cs.onSurface.withValues(alpha: 0.1),
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const WeatherWidget(),
                  const SizedBox(height: AppTheme.space12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 175),
                    child: Row(
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: MessagesWidget()),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: EarningsWidget()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppTheme.space24),
            Container(
              padding: const EdgeInsets.all(AppTheme.space8),
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest,
                border: Border.all(
                  color: cs.onSurface.withValues(alpha: .1),
                ),
                borderRadius: BorderRadius.circular(AppTheme.space32),
                boxShadow: [
                  BoxShadow(
                    color: cs.onSurface.withValues(alpha: 0.1),
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const ArrivalCountdownCard(),
                  const SizedBox(height: AppTheme.space16),
                  const ClientInfoCard(),
                  const SizedBox(height: AppTheme.space16),
                  FlightProgressSlider(
                    value: _progress, 
                    onChanged: (v) => setState(() => _progress = v),
                  ),
                  const SizedBox(height: AppTheme.space16),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () => print('o'),
                        style: AppTheme.pillButtonDark(context),
                        child: const Text('Confirm Arrival'),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => print('o'),
                        style: AppTheme.pillButtonPrimary(context),
                        child: const Text('Prepay'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}