import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ParaAccordion extends StatelessWidget {
  const ParaAccordion ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildPackIncludes(),
        _buildFlightSchedule(),
        _buildCertificationSafety(),
        _buildEquipement(),
      ],
    );
  }
  ExpansionTile _buildPackIncludes () {
    return ExpansionTile(
      title: Text(
        "What this pack includes ",
        style: AppTheme.heading3) 
    );
  }
  ExpansionTile _buildFlightSchedule () {
    return ExpansionTile(
      title: Text(
        "What this pack includes ",
        style: AppTheme.heading3) 
    );
  }
  ExpansionTile _buildCertificationSafety () {
    return ExpansionTile(
      title: Text(
        "What this pack includes ",
        style: AppTheme.heading3) 
    );
  }
  ExpansionTile _buildEquipement () {
    return ExpansionTile(
      title: Text(
        "What this pack includes ",
        style: AppTheme.heading3) 
    );
  }
}