import 'dart:ui';
import 'package:cruze_control/screens/login_screen/login_screen.dart';
import 'package:cruze_control/screens/register_screen/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final RegisterController controller = Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [

          Image.asset(
            'assets/images/backgroundbike.jpg',
            fit: BoxFit.cover,
          ),

          Container(
            color: Colors.black.withOpacity(0.6),
          ),

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
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: SingleChildScrollView(
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
                              border: Border.all(color: const Color(0xffF2CE60)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:  TextFormField(
                              controller: controller.nameController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
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
                              border: Border.all(color: const Color(0xffF2CE60)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: controller.emailController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
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
                              border: Border.all(color: const Color(0xffF2CE60)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:  TextFormField(
                              obscureText: true,
                              controller: controller.passwordController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                prefixIcon:
                                    Icon(Icons.key, color: Color(0xffF2CE60)),
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
                          Obx(() => SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: controller.isLoading.value
                                  ? null
                                  : controller.registerUser,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffF2CE60),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator(color: Colors.black)
                                  : const Text(
                                'Register',
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            ),
                          )),

                          const SizedBox(height: 30),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
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
                          ),
                        ],
                      ),
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
