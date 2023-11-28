import 'package:flutter/material.dart';

class HorizontalMargin extends StatelessWidget {
  const HorizontalMargin({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
