import 'package:flutter/material.dart';
import 'package:dotti/widgets/meditation_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Expanded(child: MeditationCard()),
          SizedBox(width: 16),
          Expanded(child: MeditationCard()),
          SizedBox(width: 16),
          Expanded(child: MeditationCard()),
        ],
      ),
    );
  }
}
