import 'package:cruze_control/screens/dashboard_screen/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void loginUser() async {
    isLoading.value = true;

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter email and password',
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      isLoading.value = false;
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ✅ Store/update user data in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'lastLogin': DateTime.now(),
      }, SetOptions(merge: true)); // merge so data won't overwrite existing fields

      Get.snackbar(
        'Success',
        'Login successful',
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );

      Future.delayed(const Duration(seconds: 1), () {
        Get.offAll(() => const DashboardScreen());
      });
    } on FirebaseAuthException catch (e) {
      String message = 'Login failed';
      if (e.code == 'user-not-found') {
        message = 'User not found';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email address';
      }

      Get.snackbar(
        'Error',
        message,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
