import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/signup/verifyEmail.screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  Rx<bool> isShowPassword = false.obs;
  Rx<bool> isCheck = true.obs;

  void setHide() {
    isShowPassword.value = !isShowPassword.value;
  }

  void setCheck() {
    isCheck.value = !isCheck.value;
  }

  void goToVerifyEmail(){
    Get.to(() => const VerifyEmailScreen());
  }

}
