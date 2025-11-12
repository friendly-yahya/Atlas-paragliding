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
            IntrinsicHeight(
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
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                          child: Column(
                            children: [
                              
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(Icons.star_rate_rounded,
                                      size: 16,),
                                      Text('4.9')
                                    ],
                                  ),
                                  Icon(
                                    Icons.circle,
                                    size: 4,
                                  ),
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
                            Text('Hicham'),
                            Icon(Icons.favorite_border),
                          ],
                          
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                    
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$85/Essential Flight'),
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
                        child: Text('Book Flight Now'))
                      ],
                    ),
                  ),
                ],
              ),
            ),
        );

  }
}
