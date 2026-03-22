import 'package:flutter/material.dart';
import 'package:atlas_paragliding/widgets/greeting_title.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/widgets/earnings_widget.dart';
import 'package:atlas_paragliding/widgets/messages_widget.dart';
class PilotHomeScreen extends StatelessWidget {
  const PilotHomeScreen({super.key});

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
                padding: const EdgeInsets.all(AppTheme.space12),
                child: Column(
                  children: [
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
            );
  }
}