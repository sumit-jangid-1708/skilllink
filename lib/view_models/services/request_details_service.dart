import 'package:skill_link/data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';
import '../../data/app_exceptions.dart';

class RequestDetailsService {
  Future<dynamic> getTechnicianApi(int id) async {
    dynamic response = await _apiServices.getApi('${AppUrl.technicians}$id/');
    return response;
  }
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> getRequestApi(int id) async {
    dynamic response = await _apiServices.getApi('${AppUrl.requests}$id/');
    return response;
  }

  Future<dynamic> cancelRequestApi(int id) async {
    dynamic response = await _apiServices.patchApi({'status': 'cancelled'}, '${AppUrl.requests}$id/status/');
    if (response is! Map || response['id'] == null) {
      throw FetchDataException(response.toString());
    }
    return response;
  }

  Future<dynamic> submitReviewApi(int id, data) async {
    dynamic response = await _apiServices.postApi(data, '${AppUrl.requests}$id/review/', requiresAuth: true);
    if (response is! Map || response['id'] == null) {
      throw FetchDataException(response.toString());
    }
    return response;
  }
}
