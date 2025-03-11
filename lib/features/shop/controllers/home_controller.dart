import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  Rx carounselIndex = 0.obs;

  void updateCarounselIndex(val) {
    carounselIndex.value = val;
  }

  void onPressDotNavigator(val) {
    carounselIndex.value = val;
    buttonCarouselController.jumpToPage(val);
  }
}
