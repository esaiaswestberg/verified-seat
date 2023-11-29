import 'package:flutter/material.dart';

class SubTitleLabel extends StatelessWidget {
  const SubTitleLabel({
    Key? key,
    required this.text,
    this.fontSize = 23,
    this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
