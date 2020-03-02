import 'package:flutter/material.dart';

void main() => runApp(RandomColorApp());

class RandomColorApp extends StatefulWidget {
  @override
  _RandomColorAppState createState() => _RandomColorAppState();
}

class _RandomColorAppState extends State<RandomColorApp> {
  static final int a = 255;
  static final List listToShuffle = List.generate(a + 1, (i) => i);
  Color _bgColor;
  Color _textColor;

  /// Changes the [_bgColor] to randomly generated one.
  ///
  /// Also changes the [_textColor] to inverted to the [_bgColor]
  /// for better visibility.
  void _setBackgroundColorRandomly() {
    setState(() {
      _bgColor = _getRandomColor();
      _textColor = _getInvertedToBackgroundColor();
    });
  }

  Color _getRandomColor() {
    listToShuffle.shuffle();
    int r = listToShuffle[0];
    listToShuffle.shuffle();
    int g = listToShuffle[0];
    listToShuffle.shuffle();
    int b = listToShuffle[0];
    return Color.fromARGB(a, r, g, b);
  }

  Color _getInvertedToBackgroundColor() {
    return Color.fromARGB(
        a, a - _bgColor.red, a - _bgColor.green, a - _bgColor.blue);
  }

  @override
  void initState() {
    super.initState();
    _bgColor = _getRandomColor();
    _textColor = _getInvertedToBackgroundColor();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _setBackgroundColorRandomly();
        },
        child: Container(
          decoration: BoxDecoration(color: _bgColor),
          child: Center(
            child: Text(
              'Hey there',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 32,
                color: _textColor,
              ),
            ),
          ),
        ));
  }
}
