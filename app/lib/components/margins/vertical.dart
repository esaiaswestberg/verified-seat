import 'package:flutter/material.dart';

class VerticalMargin extends StatelessWidget {
  const VerticalMargin({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
