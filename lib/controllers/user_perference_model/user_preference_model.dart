
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_token_model.dart';


class UserPreference{

  Future<bool> saveUser(UserModal responseModal)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModal.token.toString());
    return true;
  }
  Future<UserModal> getUser()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    return UserModal(
        token: token
    );
  }
  Future<bool> removeUser()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}