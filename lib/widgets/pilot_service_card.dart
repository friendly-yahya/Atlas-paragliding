import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math';
class PilotServiceCard extends StatefulWidget {
  const PilotServiceCard({super.key});

  @override
  State<PilotServiceCard> createState() => _PilotServiceCardState();
}

class _PilotServiceCardState extends State<PilotServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.all(16),
            
          child: 
            Container(
              decoration: BoxDecoration(
                border:Border.all(
                  color: AppTheme.strokeColor,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(AppTheme.rounded12)
              ),
              padding: EdgeInsets.all(16),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    
                    Expanded(
                      flex: 1,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/hicham.png',
                                
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          DefaultTextStyle(
                            style: AppTheme.micro,
                            child: Column(
                              children: [
                                
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          size: 16,
                                          color: AppTheme.starColor,
                                          
                                          ),

                                        SizedBox(width:1 ,),
                                        Text('4.9')
                                      ],
                                    ),
                                    SizedBox(width: 2,),
                                    Icon(
                                      Icons.circle,
                                      size: 4,
                                    ),
                                    SizedBox(width: 2,),
                                    Row(
                                      children: [
                                        Text('150 flights')
                                      ],
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Certified & Insured ')),
                              ],
                            ),
                          ),
                        ],
                      ) 
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Hicham',
                                style: AppTheme.heading4,
                                ),
                              Icon(Icons.favorite_border),
                            ],
                            
                          ),
                          Divider(
                      
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '\$85',
                                    style: AppTheme.heading2,
                                  ),
                                  Text(
                                    '/Essential Flight',
                                    style: AppTheme.micro,
                                  )
                                ],
                              ),
                              Transform.rotate(
                                angle: -pi / 2,
                                child: Icon(Icons.chevron_left_rounded)),
                            ],
                            
                          ),
                          
                          TextButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Ain\'t no party like a diddy party')),
                            );
                          },
                          style: AppTheme.primaryButton, 
                          child: Text('Book Flight Now'))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        );

  }
}
