import 'package:flutter/material.dart';
import 'package:verified_seat/pages/event.dart';
import 'package:verified_seat/pages/locked.dart';
import 'package:verified_seat/pages/scanner.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const VerifiedSeat());
}

class VerifiedSeat extends StatelessWidget {
  const VerifiedSeat({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LockedPage(),
      routes: {
        '/event': (context) => const EventPage(),
        '/scanner': (context) => const ScannerPage()
      },
    );
  }
}
