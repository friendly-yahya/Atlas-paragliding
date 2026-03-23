import 'package:flutter/material.dart';
import 'package:atlas_paragliding/widgets/greeting_title.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/widgets/earnings_widget.dart';
import 'package:atlas_paragliding/widgets/messages_widget.dart';
import 'package:atlas_paragliding/widgets/weather_widget.dart';
import 'package:atlas_paragliding/widgets/arrival_countdown_card.dart';
import 'package:atlas_paragliding/widgets/client_info_card.dart';
import 'package:atlas_paragliding/widgets/flight_progress_slider.dart';
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
              backgroundColor: AppTheme.kBgDeep,
              appBar: AppBar(
                backgroundColor: AppTheme.kBgDeep,
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
                      color: AppTheme.kBgCard,
                      border: Border.all(
                        color: AppTheme.backgroundColor.withValues(alpha: .1),
                      ),
                      borderRadius: BorderRadius.circular(AppTheme.space32),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.backgroundColor.withValues(alpha: 0.1),
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
                      color: AppTheme.kBgCard,
                      border: Border.all(
                        color: AppTheme.backgroundColor.withValues(alpha: .1),
                      ),
                      borderRadius: BorderRadius.circular(AppTheme.space32),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.backgroundColor.withValues(alpha: 0.1),
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
                                  backgroundColor: WidgetStatePropertyAll(AppTheme.kPrimary),
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