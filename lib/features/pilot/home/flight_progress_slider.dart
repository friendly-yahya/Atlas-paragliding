import 'package:flutter/material.dart';

class AsymmetricTrackShape extends RoundedRectSliderTrackShape {
  final double activeHeight;
  final double inactiveHeight;

  const AsymmetricTrackShape({
    this.activeHeight = 4,
    this.inactiveHeight = 4,
  });

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackTop = offset.dy + (parentBox.size.height - inactiveHeight) / 2;
    return Rect.fromLTWH(
      offset.dx,
      trackTop,
      parentBox.size.width,
      inactiveHeight,
    );
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 0,
  }) {
    final canvas = context.canvas;
    final trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
    );

    final inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor!;
    canvas.drawRRect(
      RRect.fromRectAndRadius(trackRect, const Radius.circular(2)),
      inactivePaint,
    );

    final activeTop = trackRect.top + (trackRect.height - activeHeight) / 2;
    final activeRect = Rect.fromLTRB(
      trackRect.left,
      activeTop,
      thumbCenter.dx,
      activeTop + activeHeight,
    );
    final activePaint = Paint()
      ..color = sliderTheme.activeTrackColor!;
    canvas.drawRRect(
      RRect.fromRectAndRadius(activeRect, const Radius.circular(2)),
      activePaint,
    );
  }
}

class GlowRingThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final double ringRadius;

  const GlowRingThumbShape({
    this.thumbRadius = 6,
    this.ringRadius = 12,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(ringRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    
    final cs = sliderTheme.activeTrackColor != null 
        ? ColorScheme.fromSeed(seedColor: sliderTheme.activeTrackColor!)
        : ColorScheme.fromSeed(seedColor: Colors.blue);

    final glowPaint = Paint()
      ..color = sliderTheme.activeTrackColor!.withValues(alpha: 0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawCircle(center, ringRadius - 1, glowPaint);

    final ringPaint = Paint()
      ..color = sliderTheme.activeTrackColor!.withValues(alpha: 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, ringRadius - 1, ringPaint);

    final dotPaint = Paint()..color = sliderTheme.activeTrackColor!;
    canvas.drawCircle(center, thumbRadius, dotPaint);
  }
}

class FlightProgressSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const FlightProgressSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<FlightProgressSlider> createState() => _FlightProgressSliderState();
}

class _FlightProgressSliderState extends State<FlightProgressSlider> {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 4,
        trackShape: const AsymmetricTrackShape(
          activeHeight: 4,
          inactiveHeight: 4,
        ),
        activeTrackColor: cs.primary,
        inactiveTrackColor: cs.onSurface.withValues(alpha: 0.6),
        thumbShape: const GlowRingThumbShape(
          thumbRadius: 5,
          ringRadius: 9,
        ),
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: Slider(
        value: widget.value,
        onChanged: widget.onChanged,
      ),
    );
  }
}