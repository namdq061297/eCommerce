
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/screens/home/home.screen.dart';
import 'package:t_store/features/shop/screens/store/store.dart';

class NavigationController extends GetxController {
  final Rx selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    Container(color: Colors.yellowAccent),
    Container(color: Colors.pink)
  ];
}