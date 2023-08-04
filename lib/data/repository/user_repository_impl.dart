import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/model/user_details_model.dart';
import '../../domain/model/user_list_model.dart';
import '../../domain/repository/user_repository.dart';
import '../../utils/constants.dart';
import '../api/api_service.dart';
import '../api/response_exception.dart';
import '../api/response_handler.dart';
import '../entity/response_entity.dart';
import '../entity/response_entity_list.dart';
import '../entity/user_entity.dart';
import '../storage/local_storage.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required this.apiService,
  });

  final ApiService apiService;

  @override
  Future<List<UserListModel>> fetchAllUsers(int page) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    try {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var response = await ResponseHandler.handleResponse(() =>
            apiService.getRequest(
                '${ApiEndPoints.apiBaseUrl}${ApiEndPoints.fetchUsers}$page'));
        saveAllUsers(response.data);
        final userEntityList =
            ResponseEntityList.fromJson(jsonDecode(response.data)).data;
        List<UserListModel> allUsers = [];
        for (var userEntity in userEntityList) {
          allUsers.add(UserEntity.fromJson(userEntity).toUserListModel());
        }
        return allUsers;
      } else {
        final usersJson = await LocalStorage.loadLocalData(AppKeys.usersJson);
        final userEntityList =
            ResponseEntityList.fromJson(jsonDecode(usersJson)).data;
        List<UserListModel> allUsers = [];
        for (var userEntity in userEntityList) {
          allUsers.add(UserEntity.fromJson(userEntity).toUserListModel());
        }
        return allUsers;
      }
    } catch (e) {
      throw UnknownException(e.toString()).message;
    }
  }

  @override
  Future<UserDetailsModel> fetchUserDetails(int userId) async {
    try {
      final response = await ResponseHandler.handleResponse(() =>
          apiService.getRequest(
              '${ApiEndPoints.apiBaseUrl}${ApiEndPoints.fetchUserDetails}$userId'));
      final responseEntity = ResponseEntity.fromJson(jsonDecode(response.data));
      final userEntity = responseEntity.data;
      final userDetailsModel = UserEntity.fromJson(userEntity).toUserDetailsModel();
      return userDetailsModel;
    } catch (e) {
      throw UnknownException(e.toString()).message;
    }
  }

  @override
  saveAllUsers(String usersJson) {
    try {
      LocalStorage.saveLocalData(AppKeys.usersJson, usersJson);
    } catch (e) {
      throw UnknownException(e.toString()).message;
    }
  }
}
