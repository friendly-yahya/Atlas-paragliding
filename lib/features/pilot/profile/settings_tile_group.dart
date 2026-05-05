import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/pilot/profile/settings_tile.dart';

class SettingsTileGroup extends StatelessWidget {
  const SettingsTileGroup({
    super.key,
    required this.tiles,
    });
  final List<SettingsTile> tiles;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(tiles.length, (i) {
        final isFirst = i == 0;
        final isLast = i == tiles.length-1;
        final radius = BorderRadius.only(
          topLeft: Radius.circular(isFirst ? 12 : 0),
          topRight: Radius.circular(isFirst ? 12 : 0),
          bottomLeft: Radius.circular(isLast ? 12 : 0),
          bottomRight: Radius.circular(isLast ? 12 :0)
        );
        return Column(
          children: [
            ClipRRect(
              borderRadius: radius,
              child: Material(
                color: AppTheme.kBgCard,
                borderRadius: radius,
                child: InkWell(
                  onTap: tiles[i].onTap,
                  borderRadius: radius,
                  splashColor: AppTheme.kPrimary.withValues(alpha: 0.1),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppTheme.space16,
                      vertical: AppTheme.space12,
                    ),
                    child: Row(
                      children: [
                        Icon(tiles[i].icon, color: AppTheme.kTextPrimary, size: 20),
                        SizedBox(width: AppTheme.space12),
                        Expanded(
                          child: Text(
                            tiles[i].label,
                            style: AppTheme.paragraphSmMedium.copyWith(
                              color: AppTheme.kTextPrimary,
                            ),
                          ),
                        ),
                        Icon(Icons.chevron_right_rounded, color: AppTheme.kTextPrimary),
                      ],
                    ),
                ),
              ),
            ),
          ),
          if (!isLast)
            Divider(
              height: 1,
              thickness: 1,
              color: AppTheme.kBgDeep,
              indent: 0,
              endIndent: 0,
            )
        ],
        
        );
      }),
    );
  }
}