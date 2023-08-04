class UserDetailsModel {
  UserDetailsModel({
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.email,
    required this.avatarAsset,
  });

  final int userId;
  final String userFirstName;
  final String userLastName;
  final String email;
  final String avatarAsset;
}
