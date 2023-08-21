import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  final String aboutText = "BrainStorm App version 1.0.0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BrainStorm"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Center(
          child: Text(
            aboutText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
