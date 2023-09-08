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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Roll the Dice",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  Theme.of(context).colorScheme.primary.withOpacity(0.2)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.4, 0.9])),
        child: Stack(children: [
          widget.diceAmount == 1 || widget.diceAmount == 2
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < widget.diceAmount; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Dice(
                            turns: turns,
                          ),
                        ),
                    ],
                  ),
                )
              : Expanded(
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
          Positioned(
            bottom: 10,
            left: MediaQuery.of(context).size.width / 2 - 70,
            right: MediaQuery.of(context).size.width / 2 - 70,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  turns += 1.0;
                });
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(100, 50)),
              ),
              child: const Text("Roll"),
            ),
          ),
        ]),
      ),
    );
  }
}
