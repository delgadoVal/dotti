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
  double _currentSeconds = 0;
  double _totalSeconds = 1;
  bool _isCompleted = false;

  static const _meditationDuration = Duration(seconds: 30);

  @override
  void initState() {
    super.initState();

    _lottieController = AnimationController(
      vsync: this,
      duration: _meditationDuration,
    );

    setState(() {
      _totalSeconds = _meditationDuration.inMilliseconds.toDouble();
    });

    _initAudio();
  }

  Future<void> _initAudio() async {
    final meditation = ref.read(selectedMeditationProvider);
    if (meditation == null) return;

    await _audioPlayer.setAsset(meditation.soundAsset);

    setState(() {
      _totalSeconds = _audioPlayer.duration?.inMilliseconds.toDouble() ?? 1;
    });

    _audioPlayer.positionStream.listen((position) {
      if (mounted) {
        setState(() => _currentSeconds = position.inMilliseconds.toDouble());
      }
    });

    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _lottieController.stop();
        _lottieController.reset();
        setState(() {
          _isPlaying = false;
          _currentSeconds = 0;
          _isCompleted = true;
        });
        _audioPlayer.stop();
        _audioPlayer.seek(Duration.zero);
      }
    });
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
    _audioPlayer.dispose();
    _lottieController.dispose();
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
                  ),
                ),
                const SizedBox(height: 24),
                ProgressSlider(
                  currentSeconds: _currentSeconds,
                  totalSeconds: _totalSeconds,
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
