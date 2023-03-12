import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  const Button({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 300,
          child: ElevatedButton(
            onPressed: () => onPressed(),
            style: ElevatedButton.styleFrom(
              primary: Colors.greenAccent,
              elevation: 9,
            ),
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
