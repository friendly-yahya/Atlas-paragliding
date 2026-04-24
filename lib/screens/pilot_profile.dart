import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/widgets/settings_tile.dart';
import 'package:atlas_paragliding/widgets/settings_tile_group.dart';

class _TileData {
  const _TileData({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;
}


class PilotProfile extends StatelessWidget {
  const PilotProfile({super.key, required this.onSwitchToClient});
  final VoidCallback onSwitchToClient;
 
  @override
  Widget build(BuildContext context) {

    final List<_TileData> tiles = [
      _TileData(icon: Icons.person_outline,             label: 'Full name',        onTap: () {}),
      _TileData(icon: Icons.mail_outline,               label: 'Email Address',    onTap: () {}),
      _TileData(icon: Icons.phone_outlined,             label: 'Phone Numbers',    onTap: () {}),
      _TileData(icon: Icons.location_on_outlined,       label: 'Base Location',    onTap: () {}),

    ] ;

    return Scaffold(
      backgroundColor: AppTheme.kBgDeep,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SettingsTileGroup(
                tiles: tiles.map((t) => SettingsTile(icon: t.icon, label: t.label, onTap: t.onTap,)).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
