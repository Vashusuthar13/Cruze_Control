import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../_models/call_logs_model.dart';
import '../service/firebase_service.dart';

class CallLogsController extends GetxController {
  final callLogs = <CallModel>[].obs;
  final database = FirebaseService.database.ref();

  void addCall(CallModel call) {
    callLogs.add(call);

    // Upload only serializable data to Firebase

    try {
      database.child('call_logs').push().set(call.toJson());
      print("Uploaded to Firebase");

    }
    catch(e){
      print("Firebase upload failed: $e");
    }
  }

  void deleteCall(int index) {
    callLogs.removeAt(index);
    // Optionally remove from Firebase if you store the key
  }

  void clearAllCalls() {
    callLogs.clear();
    // Optional: database.child('call_logs').remove();
  }
}


