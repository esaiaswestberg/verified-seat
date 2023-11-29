import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanner'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: _buildScanner(),
      ),
    );
  }

  Stack _buildScanner() {
    // Define screen size
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    // Build scanner
    return Stack(
      children: [
        // QR code scanner
        SizedBox(
          width: width,
          height: height,
          child: QrCamera(
            qrCodeCallback: (code) => print(code),
          ),
        ),

        // Overlay
        _buildOverlay(),
      ],
    );
  }

  Widget _buildOverlay() {
    return Center(
      child: Icon(
        Icons.qr_code_scanner,
        size: 175,
        color: Colors.white.withOpacity(.5),
      ),
    );
  }
}
