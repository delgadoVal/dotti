import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard(this.title, this.text, {super.key});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text(title), Text(text)],
    );
  }
}
