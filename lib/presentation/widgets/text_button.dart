import 'package:flutter/material.dart';
import 'package:getex/core/constants.dart';

class TextButtonWidgets extends StatelessWidget {
  const TextButtonWidgets({
    super.key,
    required this.buttontext,
    this.onPressed,
  });
  final String buttontext;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: boxborderRadius,
          color: Colors.black,
        ),
        width: 70,
        height: 50,
        child: TextButton(onPressed: onPressed, child: Text(buttontext)));
  }
}
