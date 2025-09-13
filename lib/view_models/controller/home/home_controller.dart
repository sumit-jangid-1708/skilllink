import 'package:get/get.dart';
import 'package:skill_link/data/repository/home_repository/home_repository.dart';
import 'package:skill_link/data/response/status.dart';
import 'package:skill_link/models/home/user_list_model.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  final error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(UserListModel value) => userList.value = value;
  void setError(String value) => error.value = value;

  void userListApi() {
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
