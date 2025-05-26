import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static final FirebaseDatabase database = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: 'https://cruzecontrol-7a60f-default-rtdb.asia-southeast1.firebasedatabase.app',
  );

  static DatabaseReference getCallLogsRef() {
    return database.ref('call_logs');
  }
}
