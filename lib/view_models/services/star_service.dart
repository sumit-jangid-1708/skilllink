import 'package:skill_link/data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';

class StarService {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> getSavedApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.saved);
    return response;
  }
}
