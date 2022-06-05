import 'package:flutter/material.dart';
import 'dart:math'; // The math library includes a random number generator

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  void rollDice() {
    setState(() {
      /* "setState" is important, because it actually
       * brings the App to update the Screen according to
       * the changes made. Without "setState", the code
       * might work, but nothing visible would happen. */
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      /* "nextInt(max)" generates an int between 0 and [max],
     * excluding [max] (so effectively between 0 and [max - 1]).
     * This means, to get numbers from 1 to 6, we have to add 1
     * to the randomly generated number. */
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row /*Clickable Dice Images*/ (
        children: <Widget>[
          Expanded /*Left clickable Dice Image*/ (
            child: TextButton(
              onPressed: () {
                rollDice();
              },
              child: Padding(
                /* The TextButton-Class already adds a Padding of 8.0
                to the widget with the additional Padding we expand
                the Padding to 16.0. */
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
          ),
          Expanded /*Right clickable Dice Image*/ (
            child: TextButton(
              onPressed: () {
                rollDice();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
