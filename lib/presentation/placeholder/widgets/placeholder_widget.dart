import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final String title;

  const PlaceholderWidget({super.key, this.title = "Placeholder"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF101820),
      ),
      body: const Center(
        child: Icon(
          Icons.hourglass_empty,
          size: 80,
          color: Colors.grey,
        ),
      ),
    );
  }
}
