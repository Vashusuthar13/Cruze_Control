import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruze_control/screens/splash_screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../utills/utils.dart';





class VerifyEmailViewModal extends GetxController{


  sendVerifyLink()async{
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value)=>{
      Utils.toastMessage('Link send \nA link has been send to your email'),
    });
  }

  RxBool loading = false.obs;

  reload()async{
    loading.value = true;
    // await FirebaseAuth.instance.currentUser!.reload().then((value) => {Get.offAll(Wrapper())});
    await FirebaseAuth.instance.currentUser!.reload();
    var user = FirebaseAuth.instance.currentUser;

    if (user != null && user.emailVerified) {
      FirebaseFirestore.instance.collection(user.uid).doc("user data").set({

      }).then((value){
        log("Data Inserted");
      });
      Get.to(SplashScreen());
    } else {
      Utils.snackBar("Not Verified",
          "Please verify your email before proceeding.");
    }
    loading.value = false;

  }
}
