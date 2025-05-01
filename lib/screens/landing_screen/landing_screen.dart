import 'package:cruze_control/screens/dashboard_screen/dashboard_screen.dart';
import 'package:cruze_control/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgroundbike.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark overlay for text readability
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          // Content
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                width: double.infinity,
                height: 370,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff2F2F2F).withOpacity(0.6)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Cruze Control",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Ride Safe, Ride Smart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Keeps you updated with real-time ride stats for a safer, smarter journey.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 30),

                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Divider(
                          height: 0.5,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),

                      SizedBox(height: 40),

                      Container(
                        width: 300,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF2CE60),
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child:  Text(
                            "Get Started",
                            style: TextStyle(color: Color(0xff1F1F1F), fontSize: 20,),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}