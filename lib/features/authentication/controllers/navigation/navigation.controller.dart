
import 'package:get/get.dart';
import 'package:t_store/features/shop/screens/home/home.screen.dart';
import 'package:t_store/features/shop/screens/setting/setting.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/features/shop/screens/wishlist/wishlist.dart';

class NavigationController extends GetxController {
  final Rx selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const WishlistScreen(),
    const SettingsScreen(),
  ];
}