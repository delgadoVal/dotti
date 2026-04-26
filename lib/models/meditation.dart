enum MeditationType { breathing1, breathing2, breathing3 }

class Meditation {
  final MeditationType type;
  final String title;
  final String description;
  final String imagePath;
  final String animationAsset;
  final String soundAsset;

  const Meditation({
    required this.type,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.animationAsset,
    required this.soundAsset,
  });
}

// Available meditations catalog
const meditations = {
  MeditationType.breathing1: Meditation(
    type: MeditationType.breathing1,
    title: 'Respiración 4-7-8',
    description:
        'Práctica para calmar el sistema nervioso y regular la presión arterial.',
    imagePath: 'assets/img/tecnica_4_7_8.png',
    animationAsset: 'assets/animations/tecnica_4_7_8.json',
    soundAsset: 'assets/audio/tecnica_4_7_8.mp3',
  ),
  MeditationType.breathing2: Meditation(
    type: MeditationType.breathing2,
    title: 'Respiración cuadrada',
    description:
        'Práctica para reducir el cortisol y disminuir la frecuencia cardíaca',
    imagePath: 'assets/img/tecnica_cuadrada.png',
    animationAsset: 'assets/animations/tecnica_cuadrada.json',
    soundAsset: 'assets/audio/tecnica_cuadrada.mp3',
  ),
  MeditationType.breathing3: Meditation(
    type: MeditationType.breathing3,
    title: 'Respiración 4-6',
    description: 'Práctica para regular la respuesta del sistema nervioso.',
    imagePath: 'assets/img/tecnica_4_6.png',
    animationAsset: 'assets/animations/tecnica_4_6.json',
    soundAsset: 'assets/audio/tecnica_4_6.mp3',
  ),
};
