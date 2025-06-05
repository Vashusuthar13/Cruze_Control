import 'dart:ui';
import 'package:get/get.dart';
import 'package:cruze_control/screens/dashboard_screen/dashboard_screen.dart';
import 'package:cruze_control/screens/login_screen/controller/login_controller.dart';
import 'package:cruze_control/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

import '../forgot_password/forgot_password.dart';

class LoginScreen extends StatelessWidget {

  final LoginController controller = Get.put(LoginController());


  LoginScreen({super.key});

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
                  height: 500,
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
                          'Cruze Login',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Enter Email',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffF2CE60)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child:  TextFormField(
                            controller: controller.emailController,
                            style: TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Color(0xffF2CE60),
                              ),
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
                          child: TextFormField(
                            controller: controller.passwordController,
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
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
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                            },
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => Get.find<LoginController>().loginUser(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffF2CE60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Obx(() => controller.isLoading.value ? CircularProgressIndicator(color: Colors.white,) : Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                        ),


                        const SizedBox(height: 20),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen()));

                            },
                            child: RichText(
                              text: const TextSpan(
                                text: "Don’t have an account? ",
                                style: TextStyle(color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: "Register",
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
        ],
      ),
    );
  }
}
