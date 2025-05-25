import 'package:get/get.dart';
import '../../_models/call_logs_model.dart';

class CallLogsController extends GetxController {
  var callLogs = <CallModel>[].obs;

  void addCall(CallModel call) {
    callLogs.add(call);
  }

  void deleteCall(int index) {
    callLogs.removeAt(index);
  }

  void clearAllCalls() {
    callLogs.clear();
  }
}
