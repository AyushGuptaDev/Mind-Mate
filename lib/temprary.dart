import 'package:flutter/material.dart';

class FeatureInProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("work in proggress"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.hourglass_empty,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'Working on it!\nYou will get this feature soon.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}