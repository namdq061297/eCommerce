import 'package:get/get.dart';

class ViewAllProductsController extends GetxController {
  final List<String> filterOptions = [
    'Higher Price',
    'Lower Price',
    'Sale',
    'Newest',
    'Popularity',
  ];

  final selectedFilter = 'Higher Price'.obs;

  void updateSelectedFilter(String filter) {
    selectedFilter.value = filter;
  }
}