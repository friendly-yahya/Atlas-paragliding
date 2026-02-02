import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WindowImg extends StatelessWidget {
  const WindowImg({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.rounded40),
        child: GridView.builder(
          itemCount: 4,
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            mainAxisSpacing: 8, 
            crossAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemBuilder:(context, index) {
            final images = [
              'assets/images/glide01.jpg',
              'assets/images/glide02.jpg',
              'assets/images/glide03.jpg',
              'assets/images/hicham.png',
            ];
            return ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
                
              ),
            );
          },
          
          ),
      );
    
  }
  
}