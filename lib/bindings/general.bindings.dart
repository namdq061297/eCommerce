import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication.repository.dart';
import 'package:t_store/data/repositories/user/user.repository.dart';
import 'package:t_store/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationRepository());
    Get.put(UserRepository());
    Get.put(NetworkManager());
  }
}
