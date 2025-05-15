import 'package:cruze_control/_models/call_logs_model.dart';
import 'package:cruze_control/utills/widgets/rides_status_card/ride_status_card.dart';
import 'package:flutter/material.dart';

import '../../../utills/widgets/call_logs_card/call_logs_card.dart';
import 'my_rides_screen/my_rides_screen.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {


  List<CallModel> callLogs = [
    CallModel(icon: 'assets/svg_icons/user.svg', number: '+91 8003060293', time: '09:00', day: 'Today', onDelete: (){}),
    CallModel(icon: 'assets/svg_icons/user.svg', number: '+91 8279060741', time: '12:00', day: 'Yesterday', onDelete: (){}),
    CallModel(icon: 'assets/svg_icons/user.svg', number: '+91 8003060293', time: '09:00', day: 'Yesterday', onDelete: (){}),
  ];


  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabTitles = ['Call Logs', 'My Rides'];
    final tabIcons = [Icons.call, Icons.map];

    return Scaffold(
      backgroundColor: const Color(0xff1F1F1F),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: List.generate(2, (index) {
                    final isSelected = selectedIndex == index;
                    return Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: isSelected ? Colors.yellow : Colors.transparent,
                            width: 0.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: Size(0, 60),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          setState(() => selectedIndex = index);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              tabIcons[index],
                              color: isSelected ? Colors.yellow : Colors.white,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              tabTitles[index],
                              style: TextStyle(
                                color: isSelected ? Colors.yellow : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: selectedIndex, // Determines which page is shown
                children: [
                  // Page for 'Call Logs'
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      itemCount: callLogs.length,
                      itemBuilder: (context, index) {
                        final phone = callLogs[index];

                        return Dismissible(
                          key: ValueKey(phone),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding:  EdgeInsets.only(right: 20),
                            child:  CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ),
                          onDismissed: (direction) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                callLogs.removeAt(index);
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('$phone deleted')),
                              );
                            });
                          },
                          child: SizedBox(
                            height: 90,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: false,
                                itemCount: callLogs.length,
                                itemBuilder: (context, index) {
                                  var item = callLogs[index];
                              return CallLogCard(call: item,);
                            }),
                          )
                        );
                      },
                    ),
                  ),
                  MyRidesPage()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
