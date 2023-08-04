class UserListModel {
  UserListModel({
    required this.userId,
    required this.userFirstName,
    required this.email,
    required this.avatarAsset,
  });

  final int userId;
  final String userFirstName;
  final String email;
  final String avatarAsset;
}
