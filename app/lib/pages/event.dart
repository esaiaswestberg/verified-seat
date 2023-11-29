import 'package:flutter/material.dart';
import 'package:verified_seat/components/event/tickets-info.dart';
import 'package:verified_seat/components/labels/subtitle.dart';
import 'package:verified_seat/components/labels/title.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  /// Navigate to the scanner page.
  void _goToScanner() {
    Navigator.pushNamed(context, '/scanner');
  }

  /// Refresh the page.
  Future<void> _refresh() async {
    // Implement your refresh logic here.
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildTitle(),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  minWidth: viewportConstraints.maxWidth,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TicketsInfo(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToScanner,
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  // App bar title.
  Widget _buildTitle() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleLabel(text: 'Evenemangsnamn', fontSize: 23),
        SubTitleLabel(text: '15:00 18 Dec 2023', fontSize: 11),
      ],
    );
  }
}
