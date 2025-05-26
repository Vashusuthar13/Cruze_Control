import 'package:get/get.dart';

class StartButtonController extends GetxController {
  var isOn = false.obs;

  void toggle() {
    isOn.value = !isOn.value;
  }

  void turnOff() {
    isOn.value = false;
  }

  void turnOn() {
    isOn.value = true;
  }
}
