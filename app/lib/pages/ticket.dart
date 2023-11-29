import 'package:flutter/material.dart';
import 'package:verified_seat/components/labels/title.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  // Navigate back to scanner page.
  void _goBack() => Navigator.pushReplacementNamed(context, '/scanner');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleLabel(text: 'Biljett'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _goBack(),
        ),
      ),
      body: const Center(
        child: Text('Ticket Page'),
      ),
    );
  }
}
