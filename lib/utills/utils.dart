

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils{

  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.white,
        gravity: ToastGravity.BOTTOM
    );
  }


  static toastMessageCenter(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        gravity: ToastGravity.CENTER
    );
  }
  static toastMessageTop(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        gravity: ToastGravity.TOP,

    );
  }
  static toastMessageTopRed(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.TOP,

    );
  }
  static toastMessageTopGreen(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        gravity: ToastGravity.TOP,

    );
  }

  static snackBar(String title, String message){
    Get.snackbar(
      title,
      message,

    );
  }
}