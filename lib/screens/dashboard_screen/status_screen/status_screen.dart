import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff1F1F1F),
      child: const Center(
        child: Text("Status Screen", style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
