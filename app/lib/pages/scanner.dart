import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  int _lastScanResult = 0;

  /// Handle scan results.
  void _scanResult(String? code) {
    // Skip if no code.
    if (code == null) return;

    // Rate limit to 5 scans per second.
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - _lastScanResult < 1000) return;
    _lastScanResult = now;

    // Navigate to ticket page.
    Navigator.pushReplacementNamed(context, '/ticket');
  }

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

  /// Build QR code scanner.
  Stack _buildScanner() {
    // Define screen size.
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Build scanner.
    return Stack(
      children: [
        // QR code scanner.
        SizedBox(
          width: width,
          height: height,
          child: _buildReader(),
        ),

        // Overlay.
        _buildOverlay(),
      ],
    );
  }

  Widget _buildReader() => MobileScanner(
        fit: BoxFit.cover,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            final value = barcode.rawValue;
            _scanResult(value);
          }
        },
      );

  /// Build scanner overlay.
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
