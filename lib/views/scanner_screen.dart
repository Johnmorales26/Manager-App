import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../navigation/routes.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escáner QR'),
        leading: IconButton(
          onPressed: () => context.go(Routes.routeHome),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: MobileScanner(
        onDetect: (barcode) {
          final String? productId = barcode.barcodes.first.rawValue;
          if (productId != null) {
            context.go('${Routes.routeItemDetail}/$productId');
          }
        },
      ),
    );
  }
}
