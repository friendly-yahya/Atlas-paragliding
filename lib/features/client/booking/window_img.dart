import 'package:atlas_paragliding/core/theme/app_theme.dart';
import './gallery_screen.dart'; 
import 'package:flutter/material.dart';

class WindowImg extends StatelessWidget {
  const WindowImg({super.key});

  static const List<String> _previewImages = [
    'assets/images/glide01.jpg',
    'assets/images/glide02.jpg',
    'assets/images/glide03.jpg',
    'assets/images/hicham.png',
  ];

  static const List<String> _allImages = [
    'assets/images/glide01.jpg',
    'assets/images/glide02.jpg',
    'assets/images/glide03.jpg',
    'assets/images/hicham.png',

  ];

  void _openGallery(BuildContext context, int tappedIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => GalleryScreen(
          images: _allImages,
          initialIndex: tappedIndex, 
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppTheme.rounded40),
      child: GridView.builder(
        itemCount: _previewImages.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _openGallery(context, index), 
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.rounded8),
              child: Image.asset(
                _previewImages[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}