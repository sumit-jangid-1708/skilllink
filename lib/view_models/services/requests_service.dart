import 'package:skill_link/data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';

class RequestsService {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> getRequestsApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.requests);
    return response;
  }
}
