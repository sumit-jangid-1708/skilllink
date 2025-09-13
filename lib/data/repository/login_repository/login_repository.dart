// ignore: depend_on_referenced_packages


import 'package:skill_link/data/network/network_api_services.dart';
import 'package:skill_link/res/app_url/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.loginApi);
    return response;
  }

}
