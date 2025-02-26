import 'package:get/get.dart';

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

}
