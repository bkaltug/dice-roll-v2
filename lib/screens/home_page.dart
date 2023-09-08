import 'package:dice/screens/dice_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController _controller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text("Welcome",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formkey,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    Theme.of(context).colorScheme.primary.withOpacity(0.2)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.4, 0.9])),
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Center(
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: _controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a number!";
                    }

                    if (int.parse(value) < 1) {
                      return "Please enter a number greater than 0!";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorStyle: const TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    hintText: "Enter the amount of dice you want to roll",
                    constraints: const BoxConstraints(maxWidth: 300),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Positioned(
                bottom: 10,
                left: MediaQuery.of(context).size.width / 2 - 70,
                right: MediaQuery.of(context).size.width / 2 - 70,
                child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(100, 50)),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DicePage(
                                    diceAmount: int.parse(_controller.text))));
                      }
                    },
                    child: const Text("Let's Roll")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
