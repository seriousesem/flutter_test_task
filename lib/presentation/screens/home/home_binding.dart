import 'package:flutter_test_task/data/repository/user_repository_impl.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => UserRepositoryImpl(apiService: Get.find()));
  }
}
