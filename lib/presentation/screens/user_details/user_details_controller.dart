import 'package:get/get.dart';
import '../../../data/repository/user_repository_impl.dart';
import '../../../domain/model/user_details_model.dart';
import '../../../utils/constants.dart';

class UserDetailsController extends GetxController {
  int userId = Get.arguments[AppKeys.userId] ?? 7;
  Rxn<UserDetailsModel> userDetails = Rxn();
  var isLoading = false.obs;
  late UserRepositoryImpl _userRepository;

  @override
onInit()  {
    super.onInit();
    _userRepository = Get.find();
    fetchUserDetails(userId);
  }

  fetchUserDetails(int userId) async {
    try {
      userDetails.value = await _userRepository.fetchUserDetails(userId);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

}