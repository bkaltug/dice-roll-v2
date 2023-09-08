import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatelessWidget {
  Dice({required this.turns, super.key});
  final List<String> imagePaths = [
    "assets/images/dice_1.png",
    "assets/images/dice_2.png",
    "assets/images/dice_3.png",
    "assets/images/dice_4.png",
    "assets/images/dice_5.png",
    "assets/images/dice_6.png",
  ];
  final random = Random();
  final duration = const Duration(milliseconds: 100);
  final double turns;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turns,
      duration: duration,
      child: Image.asset(
        imagePaths[random.nextInt(6)],
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.4,
      ),
    );
  }
}
