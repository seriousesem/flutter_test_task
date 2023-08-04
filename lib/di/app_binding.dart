import 'package:flutter_test_task/data/api/api_service.dart';
import 'package:get/get.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
  }
}
