import 'package:flutter/material.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
