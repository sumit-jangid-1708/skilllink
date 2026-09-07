import 'package:skill_link/data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';

class ProfileService {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> getProfileApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.me);
    return response;
  }
}
