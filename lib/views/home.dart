import 'package:dotti/models/meditation.dart';
import 'package:flutter/material.dart';
import 'package:dotti/widgets/meditation_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: MeditationCard(meditations[MeditationType.breathing]!),
          ),
          SizedBox(width: 16),
          Expanded(
            child: MeditationCard(meditations[MeditationType.bodyScan]!),
          ),
          SizedBox(width: 16),
          Expanded(
            child: MeditationCard(meditations[MeditationType.visualization]!),
          ),
        ],
      ),
    );
  }
}
