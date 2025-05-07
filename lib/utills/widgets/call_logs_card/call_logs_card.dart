import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallLogCard extends StatefulWidget {
  final String phoneNumber;
  final String time;
  final String date;
  final VoidCallback onDelete;

  const CallLogCard({
    super.key,
    required this.phoneNumber,
    required this.time,
    required this.date,
    required this.onDelete,
  });

  @override
  State<CallLogCard> createState() => _CallLogCardState();
}

class _CallLogCardState extends State<CallLogCard> {

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.phoneNumber), // Unique key
      direction: DismissDirection.endToStart, // Slide from right to left
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.red,
          child: const Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: (direction) => widget.onDelete(),
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
                'assets/svg_icons/user.svg',
                color: Colors.black,
              ),
            ),
            Text(
              widget.phoneNumber,
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
                  widget.time,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.date,
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
