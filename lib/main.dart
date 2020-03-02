import 'package:flutter/material.dart';

void main() => runApp(RandomColorApp());

class RandomColorApp extends StatefulWidget {
  @override
  _RandomColorAppState createState() => _RandomColorAppState();
}

class _RandomColorAppState extends State<RandomColorApp> {
  static final int a = 255;
  List listToShuffle = List.generate(a + 1, (i) => i);
  int r;
  int g;
  int b;
  Color bgColor;
  Color textColor = Color.fromARGB(a, a, a, a);

  /// Changes the [bgColor] to randomly generated one.
  ///
  /// Also changes the [textColor] to inverted to the [bgColor]
  /// for better visibility.
  void _setBackgroundColorRandomly() {
    listToShuffle.shuffle();
    r = listToShuffle[0];
    listToShuffle.shuffle();
    g = listToShuffle[0];
    listToShuffle.shuffle();
    b = listToShuffle[0];
    setState(() {
      bgColor = Color.fromARGB(a, r, g, b);
      textColor = Color.fromARGB(a, a - r, a - g, a - b);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _setBackgroundColorRandomly();
        },
        child: Container(
          decoration: BoxDecoration(color: bgColor),
          child: Center(
            child: Text(
              'Hey there',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 32,
                color: textColor,
              ),
            ),
          ),
        ));
  }
}
