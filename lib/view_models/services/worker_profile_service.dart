import 'package:skill_link/data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';
import '../../data/app_exceptions.dart';

class WorkerProfileService {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> getTechnicianApi(int id) async {
    dynamic response = await _apiServices.getApi('${AppUrl.technicians}$id/');
    return response;
  }

  Future<dynamic> getSavedApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.saved);
    return response;
  }

  Future<dynamic> saveTechnicianApi(int id) async {
    dynamic response = await _apiServices.postApi({'technician_id': id}, AppUrl.saved, requiresAuth: true);
    if (response is! Map || response['message'] == null) {
      throw FetchDataException(response.toString());
    }
    return response;
  }

  Future<dynamic> removeTechnicianApi(int id) async {
    dynamic response = await _apiServices.deleteApi('${AppUrl.saved}$id/');
    if (response is! Map || response['message'] == null) {
      throw FetchDataException(response.toString());
    }
    return response;
  }
}
