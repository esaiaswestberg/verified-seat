import 'package:flutter/material.dart';
import 'package:verified_seat/components/inputs/six-digit.dart';
import 'package:verified_seat/components/labels/info.dart';
import 'package:verified_seat/components/labels/subtitle.dart';
import 'package:verified_seat/components/labels/title.dart';
import 'package:verified_seat/components/margins/vertical.dart';
import 'package:verified_seat/services/events/last.dart';

class LockedPage extends StatefulWidget {
  const LockedPage({Key? key}) : super(key: key);

  @override
  State<LockedPage> createState() => _LockedPageState();
}

class _LockedPageState extends State<LockedPage> {
  Future<Widget?>? lastEventWidgetFuture;

  @override
  void initState() {
    super.initState();
    lastEventWidgetFuture = _lastEventButton();
  }

  // Submit event code and navigate to event page
  void _submitEventCode(String eventCode) {
    // TODO: Validate code
    LastEventService.setLastEvent(eventCode);
    Navigator.pushReplacementNamed(context, '/event', arguments: eventCode);
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
            SixDigitInput(autofocus: true, onComplete: _submitEventCode),
            FutureBuilder(
              future: lastEventWidgetFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return snapshot.data!;
                }

                return const SizedBox.shrink();
              },
            ),
            const VerticalMargin(height: 20),
            const InfoLabel(text: 'Koden är unik för varje evenemang')
          ],
        ),
      ),
    );
  }

  // Show button to open last event if it exists
  Future<Widget> _lastEventButton() async {
    final hasLastEvent = await LastEventService.hasLastEvent();
    if (!hasLastEvent) return const SizedBox.shrink();

    final eventCode = await LastEventService.getLastEvent();
    return Column(
      children: [
        const VerticalMargin(height: 20),
        ElevatedButton(
          onPressed: () => _submitEventCode(eventCode),
          child: const Text('Öppna senaste'),
        ),
      ],
    );
  }
}
