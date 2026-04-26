import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dotti/providers/meditation_provider.dart';

import 'package:dotti/widgets/top_bar.dart';
import 'package:dotti/widgets/animation_area.dart';
import 'package:dotti/widgets/progress_slider.dart';
import 'package:dotti/widgets/play_pause_button.dart';

class MeditationPage extends ConsumerStatefulWidget {
  const MeditationPage({super.key});

  @override
  ConsumerState<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends ConsumerState<MeditationPage> {
  bool isPlaying = false;
  bool isBellEnabled = true;
  double currentSeconds = 0;
  double totalSeconds = 180;

  void _togglePlayPause() => setState(() => isPlaying = !isPlaying);
  void _toggleBell() => setState(() => isBellEnabled = !isBellEnabled);
  void _onSeek(double value) => setState(() => currentSeconds = value);

  @override
  Widget build(BuildContext context) {
    final meditation = ref.watch(selectedMeditationProvider)!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TopBar(
              title: meditation.title,
              isBellEnabled: isBellEnabled,
              onBellToggle: _toggleBell,
            ),
            const SizedBox(height: 16),
            const Expanded(child: AnimationArea()),
            const SizedBox(height: 24),
            ProgressSlider(
              currentSeconds: currentSeconds,
              totalSeconds: totalSeconds,
              onSeek: _onSeek,
            ),
            const SizedBox(height: 16),
            PlayPauseButton(isPlaying: isPlaying, onToggle: _togglePlayPause),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
