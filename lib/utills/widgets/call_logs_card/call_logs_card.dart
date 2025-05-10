import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cruze_control/_models/call_logs_model.dart';

class CallLogCard extends StatelessWidget {
  final CallModel call;

  const CallLogCard({super.key, required this.call});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(call.icon),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.red,
          child: const Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: (direction) => call.onDelete(),
      child: Container(
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff2F2F2F),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                call.icon,
                color: Colors.black,
              ),
            ),
            Text(
              call.number,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  call.time,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                Text(
                  call.day,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
