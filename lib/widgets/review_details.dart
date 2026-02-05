import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';

class ReviewDetails extends StatelessWidget {
  const ReviewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _ReviewMetaRow(timeAgo: '2 weeks ago', rating: 5),
        Text(
          'Hicham is the real deal. Safety first, amazing skills, and speaks perfect English. The landing was so smooth I barely felt it!',
          style: AppTheme.paragraphMiniMedium,
        ),
        _ReviewProfile(imageUrl: 'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?q=80&w=580&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', name: 'Marco', location: 'Rome, Italy')
      ],
    );
  }
}

class _ReviewMetaRow extends StatelessWidget {
  final String timeAgo;
  final int rating;
  const _ReviewMetaRow({
    required this.timeAgo,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: 
                List.generate(
                  rating.clamp(0, 5), 
                  (_) =>const Icon(
                  Icons.star_rounded,
                  size: 24,
                  color: AppTheme.starColor,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.circle, size: 8, color: AppTheme.textPrimary),
            const SizedBox(width: 6),
            Text(timeAgo, style: AppTheme.paragraphSmMedium),
          ],
        );

  }
}

class _ReviewProfile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  const _ReviewProfile({
    required this.imageUrl,
    required this.name,
    required this.location,
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(imageUrl),
          child: imageUrl.isEmpty? Icon(Icons.person_2_rounded) : null,
        ),
        SizedBox(width: 12),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: AppTheme.paragraphMiniRegular,
            ),
            SizedBox(height: 4,),
            Text(
              location,
              style: AppTheme.paragraphMiniRegular,
            )
          ],
        )
      ],
    );
  }
}