import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_link/models/login/user_response_model.dart';

class UserPreferences extends GetxController {
  Future<bool> savedUser(UserResponseModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool tokenSaved = await sp.setString('token', responseModel.token.toString());
    bool loginSaved = await sp.setBool('isLogin', responseModel.isLogin!);
    return tokenSaved && loginSaved;
  }

  Future<UserResponseModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    bool? isLogin = sp.getBool('isLogin');
    return UserResponseModel(
      token: token,
      isLogin: isLogin,
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
    return true;
  }
}
