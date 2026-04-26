enum MeditationType { breathing, bodyScan, visualization }

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
  MeditationType.breathing: Meditation(
    type: MeditationType.breathing,
    title: 'Respiración 4-7-8',
    description: 'Inhala, retén y exhala.',
    imagePath: 'assets/meditation.jpg',
    animationAsset: 'assets/animations/breathing.json',
    soundAsset: 'assets/sounds/breathing.mp3',
  ),
  MeditationType.bodyScan: Meditation(
    type: MeditationType.bodyScan,
    title: 'Respiración BodyScan',
    description: 'Conecta con tu cuerpo.',
    imagePath: 'assets/meditation.jpg',
    animationAsset: 'assets/animations/breathing.json',
    soundAsset: 'assets/sounds/breathing.mp3',
  ),
  MeditationType.visualization: Meditation(
    type: MeditationType.visualization,
    title: 'Respiración y visualización',
    description: 'Redirige tu atención.',
    imagePath: 'assets/meditation.jpg',
    animationAsset: 'assets/animations/breathing.json',
    soundAsset: 'assets/sounds/breathing.mp3',
  ),
};
