
import 'package:get/get.dart';
import 'user_details_controller.dart';

class UserDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UserDetailsController());
  }
}