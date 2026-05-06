import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';

class SettingsToggleTile extends StatefulWidget {
  const SettingsToggleTile({
    super.key,
    required this.icon,
    required this.label,
    this.value = false,
    this.onChanged,
  });

  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  State<SettingsToggleTile> createState() => _SettingsToggleTileState();
}

class _SettingsToggleTileState extends State<SettingsToggleTile> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: cs.surfaceContainerHighest,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppTheme.space16,
          vertical: AppTheme.space12,
        ),
        child: Row(
          children: [
            Icon(widget.icon, color: cs.onSurface, size: 20),
            SizedBox(width: AppTheme.space12),
            Expanded(
              child: Text(
                widget.label,
                style: AppTheme.paragraphMedium.copyWith(color: cs.onSurface),
              ),
            ),
            Transform.scale(
              scale: 0.75,
              child: CupertinoSwitch(
                value: _value,
                activeTrackColor: cs.primary,
                onChanged: (val) {
                  setState(() => _value = val);
                  widget.onChanged?.call(val);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}