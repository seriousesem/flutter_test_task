import 'package:flutter/material.dart';
import 'package:flutter_test_task/data/storage/local_storage.dart';
import 'package:flutter_test_task/navigation/app_navigation.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'di/app_binding.dart';
import 'utils/constants.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage().init();
  runApp(const TestTaskApp());
}

class TestTaskApp extends StatelessWidget {
  const TestTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: ScreenTitles.app,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppScreens.initialScreen,
      getPages: AppScreens.screenRoutes,
      initialBinding: AppBinding(),
    );
  }
}

