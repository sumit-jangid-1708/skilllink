import 'package:skill_link/data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';

class HomeService {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> getProfileApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.me);
    return response;
  }

  Future<dynamic> getCategoriesApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.categories);
    return response;
  }

  Future<dynamic> getTechniciansApi({int? category, String? city, String sort = 'top_rated'}) async {
    dynamic response = await _apiServices.getApi(Uri.parse(AppUrl.technicians).replace(queryParameters: {if (category != null) 'category': '$category', if (city != null && city.isNotEmpty) 'city': city, 'sort': sort}).toString());
    return response;
  }
}
