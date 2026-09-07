import 'package:skill_link/data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';

class CategoriesService {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> getCategoriesApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.categories);
    return response;
  }
}
