import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:math';
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
      title: 'My Clean App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(), // Remove the `title` parameter
    );
  }
}

// Replace the StatefulWidget with a StatelessWidget for a simple empty page
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: 
          Row(
            children: [
              
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star_rate_rounded),
                            Text('4.9')
                          ],
                        ),
                        Icon(Icons.circle),
                        Row(
                          children: [
                            Text('150 flights')
                          ],
                        ),
                      ],
                    ),
                  ],
                ) 
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
