
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/home/home.screen.dart';

class NavigationController extends GetxController {
  final Rx selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    Container(color: Colors.blue),
    Container(color: Colors.yellowAccent),
    Container(color: Colors.pink)
  ];
}