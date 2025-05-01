import 'dart:ui';

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Let background image show
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/backgroundbike.jpg', // Replace with your image file path
            fit: BoxFit.cover,
          ),

          // Optional dark overlay
          Container(
            color: Colors.black.withOpacity(0.6),
          ),

          // Login form container
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  width: double.infinity,
                  height: 630,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Cruze Register',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Full Name',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffF2CE60)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xffF2CE60),
                              ),
                              hintText: 'Enter your name',
                              hintStyle: TextStyle(color: Colors.white60),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Email',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffF2CE60)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const TextField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined,
                                  color: Color(0xffF2CE60)),
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(color: Colors.white60),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 18,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        const Text(
                          'Password',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffF2CE60)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const TextField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.key,
                                  color: Color(0xffF2CE60)),
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(color: Colors.white60),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 18,
                              ),
                            ),
                          ),
                        ),


                        const SizedBox(height: 40),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffF2CE60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: RichText(
                            text: const TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(color: Colors.white),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    color: Color(0xffF2CE60),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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