import 'package:get/get.dart';
import '../../../data/repository/user_repository_impl.dart';
import 'user_details_controller.dart';

class UserDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserDetailsController());
    Get.lazyPut(() => UserRepositoryImpl(apiService: Get.find(),));
  }
}
