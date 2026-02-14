import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MeetingSpotMap extends StatelessWidget {
  final double longitude;
  final double latitude;
  const MeetingSpotMap({
    required this.longitude,
    required this.latitude,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    final meetingSpot = LatLng(latitude,longitude);
    return SizedBox(
      height: 340,
      
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FlutterMap(
          options: MapOptions(
            initialCenter: meetingSpot,
            initialZoom: 14,
            interactionOptions: InteractionOptions(flags: InteractiveFlag.none)
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.atlas_paragliding',
            ),
            MarkerLayer(
              markers: [
                Marker(point: meetingSpot, child: const Icon(Icons.pin_drop_rounded, color: AppTheme.primaryColor,size: 40,))
              ],
            ),
          ]
        ),
      ),
    );
  }
}