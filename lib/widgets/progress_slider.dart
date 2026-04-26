import 'package:flutter/material.dart';

class ProgressSlider extends StatelessWidget {
  final double currentSeconds;
  final double totalSeconds;
  final String Function(double) formatTime;

  const ProgressSlider({
    required this.currentSeconds,
    required this.totalSeconds,
    required this.formatTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DottiSlider(value: currentSeconds, max: totalSeconds),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatTime(currentSeconds),
                style: const TextStyle(fontSize: 11, color: Color(0xFF888888)),
              ),
              Text(
                formatTime(totalSeconds),
                style: const TextStyle(fontSize: 11, color: Color(0xFF888888)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DottiSlider extends StatelessWidget {
  final double value;
  final double max;

  const _DottiSlider({required this.value, required this.max});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: CustomPaint(
        size: const Size(double.infinity, 20),
        painter: _SliderPainter(value: value, max: max),
      ),
    );
  }
}

class _SliderPainter extends CustomPainter {
  final double value;
  final double max;

  static const _activeColor = Color(0xFF7C88FF);
  static const _inactiveColor = Color(0xFFDDDDDD);
  static const _thumbColor = Colors.white;
  static const _trackHeight = 5.0;
  static const _thumbWidth = 22.0;
  static const _thumbHeight = 15.0;
  static const _thumbHalfWidth = _thumbWidth / 2;

  const _SliderPainter({required this.value, required this.max});

  @override
  void paint(Canvas canvas, Size size) {
    final trackY = size.height / 2;
    final trackStart = _thumbHalfWidth;
    final trackEnd = size.width - _thumbHalfWidth;
    final trackWidth = trackEnd - trackStart;

    final progress = max > 0 ? (value / max).clamp(0.0, 1.0) : 0.0;
    final thumbX = trackStart + progress * trackWidth;

    // Inactive Track (full background)
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          trackStart,
          trackY - _trackHeight / 2,
          trackEnd - trackStart,
          _trackHeight,
        ),
        const Radius.circular(2),
      ),
      Paint()..color = _inactiveColor,
    );

    // Active Track (up to thumb)
    if (thumbX > trackStart) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            trackStart,
            trackY - _trackHeight / 2,
            thumbX - trackStart,
            _trackHeight,
          ),
          const Radius.circular(2),
        ),
        Paint()..color = _activeColor,
      );
    }

    // Thumb
    final thumbRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(thumbX, trackY),
        width: _thumbWidth,
        height: _thumbHeight,
      ),
      const Radius.circular(12),
    );

    canvas.drawRRect(
      thumbRect.shift(const Offset(0, 1)),
      Paint()
        ..color = Colors.black.withOpacity(0.15)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2),
    );

    canvas.drawRRect(thumbRect, Paint()..color = _thumbColor);
  }

  @override
  bool shouldRepaint(_SliderPainter old) => old.value != value;
}
