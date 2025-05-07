import 'package:flutter/material.dart';

class MyRidesPage extends StatelessWidget {
  const MyRidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1F1F1F),
      body: Center(
        child: Text(
          'This is the My Rides Page.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}