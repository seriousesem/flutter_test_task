import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ScreenTitles.homeScreen),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _UsersListViewWidget(
        homeController: _homeController,
      ),
    );
  }
}

class _UsersListViewWidget extends StatelessWidget {
  const _UsersListViewWidget({super.key, required this.homeController});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
            itemCount: homeController.allUser.value?.length,
            itemBuilder: (BuildContext context, int index) => _UserCardWidget(
              userFirstName: homeController.allUser.value?[index].userFirstName ?? "",
              email: homeController.allUser.value?[index].email ?? "",
              avatarAsset: homeController.allUser.value?[index].avatarAsset ?? "",
              tapAction: () => homeController.goToUserDetailsScreen(homeController.allUser.value?[index].userId ?? 0),
            ),
          ),
    ));
  }
}

class _UserCardWidget extends StatelessWidget {
  const _UserCardWidget({
    super.key,
    required this.userFirstName,
    required this.email,
    required this.avatarAsset,
    required this.tapAction,
  });

  final String userFirstName;
  final String email;
  final String avatarAsset;
  final Function() tapAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () => tapAction(),
          borderRadius: BorderRadius.circular(10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(avatarAsset),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userFirstName,
                    style: const TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w700,
                        fontSize: 24
                    ),
                  ),
                  Text(email),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
