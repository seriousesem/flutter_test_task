import '../../domain/model/user_details_model.dart';
import '../../domain/model/user_list_model.dart';

class UserEntity {
  UserEntity({
    required this.userid,
    required this.userFirstName,
    required this.userLastName,
    required this.email,
    required this.avatarAsset,
  });

  final int userid;
  final String userFirstName;
  final String userLastName;
  final String email;
  final String avatarAsset;

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        userid: json['id'] as int,
        userFirstName: json['first_name'] as String,
        userLastName: json['last_name'] as String,
        email: json['email'] as String,
        avatarAsset: json['avatar'] as String,
      );

  UserDetailsModel toUserDetailsModel() => UserDetailsModel(
        userId: userid,
        userFirstName: userFirstName,
        userLastName: userLastName,
        email: email,
        avatarAsset: avatarAsset,
      );

  UserListModel toUserListModel() => UserListModel(
        userId: userid,
        userFirstName: userFirstName,
        email: email,
        avatarAsset: avatarAsset,
      );
}
