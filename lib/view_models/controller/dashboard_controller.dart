import 'package:get/get.dart';

class DashboardController extends GetxController{

  var currentIndex = 0.obs;
  // RxBool isLogin = false.obs;

  void changeTab(int index){
    currentIndex.value = index;
  }

}