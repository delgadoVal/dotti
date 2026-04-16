import 'package:flutter/material.dart';
import 'widgets/option_card.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OptionCard('First Card', 'The description is here'),
                  OptionCard('Second Card', 'Another description goes here'),
                  OptionCard('Third Card', 'Yet another description'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
