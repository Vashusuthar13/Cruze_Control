import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  var userData = {}.obs;
  var isFirstLogin = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkUserData();
  }

  /// Check if user data exists in Firestore
  Future<void> checkUserData() async {
    final uid = auth.currentUser!.uid;
    final doc = await firestore.collection('users').doc(uid).get();

    if (doc.exists) {
      userData.value = doc.data()!;
      isFirstLogin.value = false; // show dashboard
    } else {
      isFirstLogin.value = true; // show popup
    }
  }

  /// Save user data after popup form
  Future<void> saveUserData(Map<String, dynamic> data) async {
    final uid = auth.currentUser!.uid;
    await firestore.collection('users').doc(uid).set(data);

    userData.value = data;
    isFirstLogin.value = false; // switch to dashboard
  }
}
