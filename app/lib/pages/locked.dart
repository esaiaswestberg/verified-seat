import 'package:flutter/material.dart';
import 'package:verified_seat/components/inputs/six-digit.dart';
import 'package:verified_seat/components/labels/info.dart';
import 'package:verified_seat/components/labels/subtitle.dart';
import 'package:verified_seat/components/labels/title.dart';
import 'package:verified_seat/components/margins/vertical.dart';

class LockedPage extends StatefulWidget {
  const LockedPage({Key? key}) : super(key: key);

  @override
  State<LockedPage> createState() => _LockedPageState();
}

class _LockedPageState extends State<LockedPage> {
  void _onComplete(String code) {
    // TODO: Validate code
    Navigator.pushReplacementNamed(context, '/event', arguments: code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleLabel(text: 'Verified Seat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SubTitleLabel(text: 'Evenemangskod'),
            const VerticalMargin(height: 20),
            SixDigitInput(autofocus: true, onComplete: _onComplete),
            const VerticalMargin(height: 20),
            const InfoLabel(text: 'Koden är unik för varje evenemang')
          ],
        ),
      ),
    );
  }
}
