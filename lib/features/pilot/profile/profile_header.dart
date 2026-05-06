import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,        // kBgCard → theme
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: cs.onSurfaceVariant,
                    child: const Icon(Icons.person, color: Colors.white, size: 40),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: cs.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: cs.surface,      // kBgDeep → theme
                          width: 2,
                        ),
                      ),
                      child: const Icon(Icons.edit, color: Colors.white, size: 11),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.space12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Mouad Khouya',
                      style: AppTheme.heading2.copyWith(color: cs.onSurface)),
                  const SizedBox(width: 6),
                  Icon(Icons.verified_rounded, color: cs.primary, size: 16),
                ],
              ),
              const SizedBox(height: 2),
              Text('Marrakech, Aguer...',
                  style: AppTheme.paragraphSmRegular
                      .copyWith(color: cs.onSurfaceVariant)),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Stat(value: '4.8', icon: Icons.star_rounded,
                  iconColor: AppTheme.starColor),     // star stays yellow always
              const _StatDivider(),
              _Stat(value: '8y+', sub: 'Of Experience'),
              const _StatDivider(),
              _Stat(value: '516+', sub: 'Flights'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, this.sub, this.icon, this.iconColor});
  final String value;
  final String? sub;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.space6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(value,
                  style: AppTheme.heading3.copyWith(
                      color: cs.onSurface, fontWeight: FontWeight.w500)),
              if (icon != null) ...[
                const SizedBox(width: 4),
                Icon(icon, color: iconColor, size: 14),
              ],
            ],
          ),
          if (sub != null)
            Text(sub!,
                style: AppTheme.paragraphMiniRegular
                    .copyWith(color: cs.onSurfaceVariant)),
        ],
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: 80,
      height: 1,
      color: cs.onSurfaceVariant.withValues(alpha: 0.2),
    );
  }
}