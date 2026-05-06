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
                      padding: EdgeInsetsGeometry.all(AppTheme.space8),
                      decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest,
                      border: Border.all(
                        color: cs.surface.withValues(alpha: .1),
                      ),
                      borderRadius: BorderRadius.circular(AppTheme.space32),
                      boxShadow: [
                        BoxShadow(
                          color: cs.surface.withValues(alpha: 0.1),
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                      child: Column(
                        children: [
                          WeatherWidget(),
                          SizedBox(height: AppTheme.space12,),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 175),
                            child: Row(
                              children: [
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: MessagesWidget()),
                                  ),
                                SizedBox(width: AppTheme.space12,),
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: EarningsWidget()),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: AppTheme.space24,),
                    Container(
                      padding: EdgeInsetsGeometry.all(AppTheme.space8),
                      decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest,
                      border: Border.all(
                        color: cs.surface.withValues(alpha: .1),
                      ),
                      borderRadius: BorderRadius.circular(AppTheme.space32),
                      boxShadow: [
                        BoxShadow(
                          color: cs.surface.withValues(alpha: 0.1),
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                      child: Column(
                        children: [
                          ArrivalCountdownCard(),
                          SizedBox(height: AppTheme.space16,),
                          ClientInfoCard(),
                          SizedBox(height: AppTheme.space16,),
                          FlightProgressSlider(value: _progress, onChanged: (v) => setState(() => _progress =v)),
                          SizedBox(height: AppTheme.space16,),
                          Row(
                            children: [
                              /* TextButton(
                                onPressed: () => print('o'),
                                style: AppTheme.bookingButtonDark,
                                child: const Text('Send Reminder'),
                              ), */
                              
                              
                              TextButton(
                                onPressed: () => print('o'),
                                style: AppTheme.bookingButtonDark,
                                child: const Text('Confirm Arrival'),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () => print('o'),
                                style: AppTheme.bookMainButtonLight.copyWith(
                                  backgroundColor: WidgetStatePropertyAll(cs.primary),
                                ),
                                child: const Text('Prepay'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            );
  }
}