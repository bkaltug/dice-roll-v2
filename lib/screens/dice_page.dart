import 'package:dice/widgets/dice.dart';
import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  const DicePage({required this.diceAmount, super.key});
  final int diceAmount;

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  double turns = 0.0;
  int imageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  Theme.of(context).colorScheme.primary.withOpacity(0.2)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.4, 0.8])),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    for (int i = 0; i < widget.diceAmount; i++)
                      Dice(
                        turns: turns,
                      )
                  ]),
            ),
          ),
          ElevatedButton(
            child: const Text("Roll"),
            onPressed: () {
              setState(() {
                turns += 1.0;
              });
            },
          ),
        ]),
      ),
    );
  }
}
