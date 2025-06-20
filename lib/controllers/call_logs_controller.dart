import 'package:cruze_control/models/call_logs_model.dart';
import 'package:get/get.dart';
import '../service/firebase_service.dart';
import 'package:firebase_database/firebase_database.dart';

class CallLogsController extends GetxController {
  final callLogs = <CallModel>[].obs;
  final database = FirebaseService.database.ref();

  @override
  void onInit() {
    super.onInit();
    fetchCallLogs();
  }

  void fetchCallLogs() async {
    try {
      DatabaseEvent event = await database.child('call_logs').once();

      if (event.snapshot.value != null) {
        final data = Map<String, dynamic>.from(event.snapshot.value as Map);

        final logs = data.entries.map((entry) {
          final value = Map<String, dynamic>.from(entry.value);
          return CallModel.fromJson(value, entry.key);
        }).toList();

        callLogs.assignAll(logs);
      } else {
        callLogs.clear();
      }
    } catch (e) {
      print('Error fetching call logs: $e');
    }
  }


  void addCall(CallModel call) async {
    try {
      await database.child('call_logs').push().set(call.toJson());
      callLogs.add(call);
      print("Uploaded to Firebase and added locally");
    } catch (e) {
      print("Firebase upload failed: $e");
    }
  }

  void deleteCall(int index) {
    final call = callLogs[index];
    final key = call.key;

    if (key != null) {
      database.child('call_logs').child(key).remove();
    }
    callLogs.removeAt(index);
  }
  void clearAllCalls() {
    callLogs.clear();

  }
}
