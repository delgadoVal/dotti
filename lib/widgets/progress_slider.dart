import 'package:flutter/material.dart';

class ProgressSlider extends StatelessWidget {
  final double currentSeconds;
  final double totalSeconds;
  final ValueChanged<double> onSeek;

  const ProgressSlider({
    required this.currentSeconds,
    required this.totalSeconds,
    required this.onSeek,
    super.key,
  });

  String _formatTime(double seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toInt().toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: currentSeconds,
          min: 0,
          max: totalSeconds,
          onChanged: onSeek,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_formatTime(currentSeconds)),
              Text(_formatTime(totalSeconds)),
            ],
          ),
        ),
      ],
    );
  }
}
