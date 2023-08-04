import 'package:get/get.dart';
import '../../../data/repository/user_repository_impl.dart';
import '../../../domain/model/user_list_model.dart';
import '../../../navigation/app_navigation.dart';
import '../../../utils/constants.dart';

class HomeController extends GetxController {
  Rxn<List<UserListModel>> allUser = Rxn();
  late UserRepositoryImpl _userRepository;
  var page = 2.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _userRepository = Get.find();
    await fetchAllUsers(page.value);
  }

  fetchAllUsers(int page) async {
    try {
      allUser.value = await _userRepository.fetchAllUsers(page);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  goToUserDetailsScreen(int userId) async {
    Get.toNamed(RoutesName.userDetails, arguments: {AppKeys.userId:userId});
  }

}
