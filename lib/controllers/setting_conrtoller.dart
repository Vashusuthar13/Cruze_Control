import 'package:get/get.dart';

class SettingController extends GetxController {
  RxBool autoReply = false.obs;
  RxBool weatherAlert = false.obs;
  RxBool parkingAlert = false.obs;

  void autoReplTap() {
    autoReply.value = !autoReply.value;
  }

  void weatherAlertTap() {
    weatherAlert.value = !weatherAlert.value;
  }

  void parkingAlertTap() {
    parkingAlert.value = !parkingAlert.value;
  }










}
