
import '../model/user_details_model.dart';
import '../model/user_list_model.dart';

abstract class UserRepository {
  Future<List<UserListModel>> fetchAllUsers(int page);
  saveAllUsers(String usersJson);
  Future<UserDetailsModel> fetchUserDetails(int userId);
}