import 'package:flutter/material.dart';


class CallLogsPage extends StatelessWidget {
  const CallLogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1F1F1F),

      body: Center(
        child: Text(
          'This is the Call Logs Page.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
