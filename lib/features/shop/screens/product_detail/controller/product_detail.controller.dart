import 'package:get/get.dart';

class ProductDetailControler extends GetxController {
  static ProductDetailControler get instance => Get.find();

  Rx<int> count = 0.obs;

  void increase() {
    count.value = count.value + 1;
  }

  void decrease() {
    if (count.value == 0) {
      return;
    } 
    count.value = count.value - 1;
  }
}
