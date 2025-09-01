import 'package:flutter/material.dart';
import 'package:card_scanner/card_scanner.dart';

class ScanCardButton extends StatelessWidget {
  const ScanCardButton({
    super.key,
    required this.cardNumberController,
    required this.cardHolderNameController,
    this.scanOptions = const CardScanOptions(
      scanCardHolderName: true,
      scanExpiryDate: true,
      possibleCardHolderNamePositions: [
        CardHolderNameScanPosition.aboveCardNumber,
      ],
    ),
  });

  final TextEditingController cardNumberController;
  final TextEditingController cardHolderNameController;

  final CardScanOptions scanOptions;

  Future<void> _scanCard(BuildContext context) async {
    try {
      final cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);
      if (!context.mounted || cardDetails == null) return;

      cardNumberController.text = cardDetails.cardNumber;
      cardHolderNameController.text = cardDetails.cardHolderName;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Card scanned successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to scan card')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _scanCard(context),
      icon: const Icon(Icons.camera_alt),
      label: const Text("Scan Card"),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        textStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}
