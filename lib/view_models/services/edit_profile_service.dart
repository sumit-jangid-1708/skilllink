import 'package:skill_link/data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';
import '../../data/app_exceptions.dart';

class EditProfileService {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> getProfileApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.customerProfile);
    return response;
  }

  Future<dynamic> getMeApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.me);
    return response;
  }

  Future<dynamic> updateProfileApi(data) async {
    dynamic response = await _apiServices.patchApi(data, AppUrl.customerProfile);
    if (response is! Map || response['id'] == null) {
      throw FetchDataException(response.toString());
    }
    return response;
  }

  Future<dynamic> uploadProfileApi(Map<String, String> data, String image) async {
    dynamic response = await _apiServices.multipartApi('PATCH', data, AppUrl.customerProfile, {'profile_photo': image});
    if (response is! Map || response['id'] == null) {
      throw FetchDataException(response.toString());
    }
    return response;
  }
}
