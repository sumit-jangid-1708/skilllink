import 'package:get/get.dart';

class BookingController extends GetxController {
  var selectedUrgency = ''.obs;

  void selectUrgency(String value) {
    selectedUrgency.value = value;
  }
}
