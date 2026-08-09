import 'package:get/get.dart';
import 'package:skill_link/models/send_otp_model.dart';
import 'package:skill_link/utils/utils.dart';
import 'package:skill_link/view_models/controller/base_controller.dart';
import 'package:skill_link/view_models/services/auth_service.dart';
import 'package:skill_link/data/storage/app_storage.dart';

import '../../models/verify_otp_model.dart';

class AuthController extends GetxController with BaseController {
  final AuthService authService = AuthService();

  var isLoading = false.obs;

  // Send OTP Model variable
  final sendOtpModel = Rxn<SendOtpModel>();
  final verifyOtpModel = Rxn<VerifyOtpResponseModel>();

  void sendOtp(String phoneNumber) async {
    try {
      isLoading.value = true;
      Map data = {
        'phone_number': phoneNumber,
      };
      final response = await authService.sendOtpApi(data);
      sendOtpModel.value = SendOtpModel.fromJson(response);
      
      isLoading.value = false;
      print(response);
      // Show success toast
      Utils.successToast(sendOtpModel.value?.message ?? "OTP sent successfully");
      
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => sendOtp(phoneNumber));
    }
  }

  void verifyOtp(String phoneNumber, String otp)async{
    try{
      isLoading.value = true;
      Map data = {
        "phone_number": phoneNumber,
        "code": otp,
        "role": "customer"
      };
      final response = await authService.verifyOtpApi(data);
      VerifyOtpResponseModel model = VerifyOtpResponseModel.fromJson(response);
      verifyOtpModel.value = model;

      // Save token to local storage
      if (model.tokens.access.isNotEmpty) {
        await AppStorage.saveToken(model.tokens.access);
      }

      isLoading.value = false;
      print(response);
    }catch(e){
      isLoading.value = false;
      handleError(e, onRetry: () => verifyOtp(phoneNumber, otp));
    }
  }
}
