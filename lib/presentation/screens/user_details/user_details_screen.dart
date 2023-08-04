import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants.dart';
import 'user_details_controller.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({super.key});

  final UserDetailsController _userDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ScreenTitles.userDetails),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _UserDetailsView(
        userDetailsController: _userDetailsController,
      ),
    );
  }
}

class _UserDetailsView extends StatelessWidget {
  const _UserDetailsView({super.key, required this.userDetailsController});

  final UserDetailsController userDetailsController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      userDetailsController.userDetails.value?.avatarAsset ??
                          ""),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      UserDetailsInscription.userId,
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      userDetailsController.userDetails.value?.userId
                              .toString() ??
                          "",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      UserDetailsInscription.userFirstName,
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      userDetailsController.userDetails.value?.userFirstName ??
                          "",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      UserDetailsInscription.userLastname,
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      userDetailsController.userDetails.value?.userLastName ??
                          "",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      UserDetailsInscription.userEmail,
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      userDetailsController.userDetails.value?.email ?? "",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
