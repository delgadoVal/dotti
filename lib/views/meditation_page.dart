import 'package:dotti/widgets/completion_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dotti/providers/meditation_provider.dart';

import 'package:dotti/widgets/top_bar.dart';
import 'package:dotti/widgets/animation_area.dart';
import 'package:dotti/widgets/progress_slider.dart';
import 'package:dotti/widgets/play_pause_button.dart';
import 'package:just_audio/just_audio.dart';

class MeditationPage extends ConsumerStatefulWidget {
  const MeditationPage({super.key});

  @override
  ConsumerState<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends ConsumerState<MeditationPage>
    with TickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();

  late AnimationController _lottieController;

  bool _isPlaying = false;
  bool _isAudioEnabled = true;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();

    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _lottieController.addListener(_onAnimationProgress);
    _lottieController.addStatusListener(_onAnimationStatus);
  }

  void _onAnimationProgress() {
    if (mounted) setState(() {});
  }

  void _onAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _audioPlayer.stop();
      setState(() {
        _isPlaying = false;
        _isCompleted = true;
      });
    }
  }

  Future<void> _initAudio() async {
    final meditation = ref.read(selectedMeditationProvider);
    if (meditation == null) return;
    await _audioPlayer.setAsset(meditation.soundAsset);
  }

  void _onAnimationLoaded(Duration animationDuration) async {
    _lottieController.duration = animationDuration;
    await _initAudio();
    if (!mounted) return;
    _audioPlayer.play();
    _lottieController.forward();
    setState(() => _isPlaying = true);
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
      _lottieController.stop();
    } else {
      _audioPlayer.play();
      _lottieController.forward();
    }
    setState(() => _isPlaying = !_isPlaying);
  }

  void _toggleAudio() {
    setState(() => _isAudioEnabled = !_isAudioEnabled);
    _audioPlayer.setVolume(_isAudioEnabled ? 1.0 : 0.0);
  }

  @override
  void dispose() {
    _lottieController.removeListener(_onAnimationProgress);
    _lottieController.removeStatusListener(_onAnimationStatus);
    _lottieController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatTime(double millis) {
    final duration = Duration(milliseconds: millis.toInt());
    final m = duration.inMinutes.toString().padLeft(2, '0');
    final s = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final meditation = ref.watch(selectedMeditationProvider)!;

    final totalMs = (_lottieController.duration ?? Duration.zero).inMilliseconds
        .toDouble();
    final currentMs = (_lottieController.value * totalMs);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                TopBar(
                  title: meditation.title,
                  isAudioEnabled: _isAudioEnabled,
                  onAudioToggle: _toggleAudio,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: AnimationArea(
                    controller: _lottieController,
                    animationAsset: meditation.animationAsset,
                    onLoaded: (composition) =>
                        _onAnimationLoaded(composition.duration),
                  ),
                ),
                const SizedBox(height: 24),
                ProgressSlider(
                  currentSeconds: currentMs,
                  totalSeconds: totalMs,
                  formatTime: _formatTime,
                ),
                const SizedBox(height: 16),
                PlayPauseButton(
                  isPlaying: _isPlaying,
                  onToggle: _togglePlayPause,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          if (_isCompleted)
            CompletionOverlay(meditationTitle: meditation.title),
        ],
      ),
    );
  }
}
