import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  Rx<bool> isShowPassword = false.obs;

  void setHide() {
    isShowPassword.value = !isShowPassword.value;
  }

}
