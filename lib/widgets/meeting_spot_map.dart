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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Where you’\ll fly',
          style: AppTheme.heading3,
        ),
        const SizedBox(height: 16),
        Text(
          'Jbal Dbab ,Agergour, Marrakech-Safi, Morocco.',
          style: AppTheme.paragraphSmRegular,),
        Text(
          'Near mosque Arhma',
          style: AppTheme.paragraphSmRegular,),
        const SizedBox(height: 24),
        SizedBox(
          height: 340,
          width: 340,
          
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.rounded12),
            child: FlutterMap(
              options: MapOptions(
                initialCenter: meetingSpot,
                initialZoom: 17.0,
                //interactionOptions: InteractionOptions(flags: InteractiveFlag.none)
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.atlas_paragliding',
                  tileDimension: 256,
                  retinaMode: true,
                ),
                CircleLayer(
                  circles: [
                    CircleMarker(
                      point: meetingSpot,
                      radius: 50,
                      color: Colors.blue.withValues(alpha: 0.15),
                      borderColor: Colors.blue.withValues(alpha: 0.7),
                      borderStrokeWidth: 2,
                      useRadiusInMeter: true,
                    ),
                  ],
                ),
                MarkerLayer(
                  rotate: false,
                  markers: [
                    Marker(
                      height: 48,
                      width: 48,
                      point: meetingSpot, 
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.location_pin,
                        color: AppTheme.primaryColor,
                        size: 48,))
                  ],
                  
                ),
              ]
            ),
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: () => print("works fine"), 
                    
                    style: AppTheme.primaryButton,
                    
                    child: Text('Whatsapp Pilot'),
                  
                    ),
        ),
        SizedBox(height: 16),
        Divider(
          color: AppTheme.textSecondary.withValues(alpha: 0.3),
          thickness: 1,
          height: 1,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}