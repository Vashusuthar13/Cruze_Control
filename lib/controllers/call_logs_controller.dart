import 'package:cruze_control/models/call_logs_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CallLogsController extends GetxController {
  final callLogs = <CallModel>[].obs;
  final firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchCallLogs();
  }


  void fetchCallLogs() async {
    try {
      final snapshot = await firestore.collection('call_logs').get();

      if (snapshot.docs.isNotEmpty) {
        final logs = snapshot.docs.map((doc) {
          final data = doc.data();
          return CallModel.fromJson(data, doc.id);
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
      final docRef =
      await firestore.collection('call_logs').add(call.toJson());


      final newCall = call.copyWith(key: docRef.id);
      callLogs.add(newCall);

      print("Uploaded to Firestore and added locally");
    } catch (e) {
      print("Firestore upload failed: $e");
    }
  }


  void deleteCall(int index) async {
    final call = callLogs[index];
    final key = call.key;

    if (key != null) {
      await firestore.collection('call_logs').doc(key).delete();
    }
    callLogs.removeAt(index);
  }


  void clearAllCalls() async {
    try {
      final batch = firestore.batch();
      final querySnapshot = await firestore.collection('call_logs').get();

      for (var doc in querySnapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
      callLogs.clear();

      print("All call logs cleared");
    } catch (e) {
      print("Failed to clear calls: $e");
    }
  }
}
