import 'package:skill_link/data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';
import '../../data/app_exceptions.dart';

class RequestServiceService {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> getCategoriesApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.categories);
    return response;
  }

  Future<dynamic> getProfileApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.customerProfile);
    return response;
  }

  Future<dynamic> createRequestApi(data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.createRequest, requiresAuth: true);
    if (response is! Map || response['id'] == null) {
      throw FetchDataException(response.toString());
    }
    return response;
  }

  Future<dynamic> uploadRequestApi(Map<String, String> data, String image) async {
    dynamic response = await _apiServices.multipartApi('POST', data, AppUrl.createRequest, {'image': image});
    if (response is! Map || response['id'] == null) {
      throw FetchDataException(response.toString());
    }
    return response;
  }
}
