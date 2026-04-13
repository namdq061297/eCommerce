import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/controllers/user.controller.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/loaders.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final user = UserController.instance.user.value;
    firstNameController.text = user?.firstName ?? '';
    lastNameController.text = user?.lastName ?? '';
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }

  Future<void> updateName() async {
    if (!formKey.currentState!.validate()) return;

    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TLoaders.warningSnackBar(title: 'No Internet', message: 'Please check your connection.');
      return;
    }

    isLoading.value = true;
    try {
      await UserController.instance.updateName(
        firstNameController.text.trim(),
        lastNameController.text.trim(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
