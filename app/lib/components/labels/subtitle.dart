import 'package:flutter/material.dart';

class SubTitleLabel extends StatelessWidget {
  const SubTitleLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
