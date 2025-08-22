import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool isAutoReplyOn = false.obs;

  void toggleAutoReply(bool value) {
    isAutoReplyOn.value = value;
    print('Auto Reply is on');
  }
}