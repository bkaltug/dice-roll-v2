import 'package:dice/screens/dice_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: "Enter the amount of dice you want to roll",
            ),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => DicePage(
                            diceAmount: int.parse(_controller.text),
                          )),
                    ),
                  ),
              child: const Text("Roll")),
        ],
      ),
    );
  }
}
