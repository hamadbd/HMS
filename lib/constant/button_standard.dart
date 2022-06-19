import 'package:flutter/material.dart';

import 'my_constant.dart';

class ButtonStandard extends StatelessWidget {
  final String buttonText;
  final VoidCallback  onPress;
  final double fontSize;

  const ButtonStandard({required this.buttonText,required this.onPress,required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPress,
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ),
    );
  }
}