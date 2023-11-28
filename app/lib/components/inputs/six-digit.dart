import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SixDigitInput extends StatefulWidget {
  const SixDigitInput(
      {super.key, required this.onComplete, this.autofocus = false});
  final Function(String) onComplete;
  final bool autofocus;

  @override
  _SixDigitInputState createState() => _SixDigitInputState();
}

class _SixDigitInputState extends State<SixDigitInput> {
  List<TextEditingController> controllers = [];
  List<FocusNode> focusNodes = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      controllers.add(TextEditingController());
      focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < 6; i++) {
      controllers[i].dispose();
      focusNodes[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 40,
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (RawKeyEvent event) {
              if (event.isKeyPressed(LogicalKeyboardKey.backspace) &&
                  controllers[index].text.isEmpty &&
                  index > 0) {
                focusNodes[index - 1].requestFocus();
              }
            },
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              autofocus: widget.autofocus && index == 0,
              decoration: const InputDecoration(
                counterText: "",
              ),
              onChanged: (value) {
                if (value.length == 1 && index < 5) {
                  focusNodes[index + 1].requestFocus();
                }

                if (controllers
                    .every((controller) => controller.text.isNotEmpty)) {
                  widget.onComplete(
                      controllers.map((controller) => controller.text).join());
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
