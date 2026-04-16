import 'package:get/get.dart';
import 'package:t_store/data/repositories/category/banner.repository.dart';
import 'package:t_store/features/shop/models/banner.modal.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final isLoading = false.obs;
  final _bannerRepository = Get.put(BannerRepository());
  final carouselCurrentIndex = 0.obs;

  final RxList<BannerModel> allBanners = <BannerModel>[].obs;
  final RxList<BannerModel> activeBanners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void onPressDotNavigator(int index) {
    carouselCurrentIndex.value = index;
  }

  /// Fetch Banners from Repository
  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      final banners = await _bannerRepository.getAllBanners();
      allBanners.assignAll(banners);

      activeBanners.assignAll(
        allBanners
            .where((banner) => banner.active)
            .toList(),
      );
      print('All Banners: ${allBanners.map((e) => e.toJson()).toList()}');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}