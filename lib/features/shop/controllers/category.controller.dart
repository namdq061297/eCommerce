import 'package:get/get.dart';
import 'package:t_store/data/repositories/category/category.repository.dart';
import 'package:t_store/features/shop/models/category.modal.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());

  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Fetch Categories from Repository
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);

      featuredCategories.assignAll(
        allCategories
            .where((cat) => cat.isFeatured && cat.parentId == null)
            .toList(),
      );
      print('All Categories: ${allCategories.map((e) => e.toJson()).toList()}');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Get Sub Categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories =
          await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Upload Categories to Firestore -- Dummy data
  Future<void> uploadCategories(List<CategoryModel> categories) async {
    try {
      isLoading.value = true;
      await _categoryRepository.uploadCategories(categories);
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Categories uploaded successfully.',
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}