import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/widgets/settings_tile.dart';
import 'package:atlas_paragliding/widgets/settings_tile_group.dart';
class PilotProfile extends StatelessWidget {
  const PilotProfile({super.key, required this.onSwitchToClient});
  final VoidCallback onSwitchToClient;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.kBgDeep,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(icon: Icons.person_outline,   label: 'Full name',   onTap: () {}),
                  SettingsTile(icon: Icons.mail_outline,      label: 'Email',       onTap: () {}),
                  SettingsTile(icon: Icons.phone_outlined,    label: 'Phone',       onTap: () {}),
                  SettingsTile(icon: Icons.location_on_outlined, label: 'Location', onTap: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
