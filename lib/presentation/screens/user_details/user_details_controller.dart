
import 'package:get/get.dart';
import '../../../utils/constants.dart';

class UserDetailsController extends GetxController {
  int userId = Get.arguments[AppKeys.userId] ?? 0;
}