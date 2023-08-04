import 'package:get/get.dart';
import '../presentation/screens/home/home_binding.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/user_details/user_details_screen.dart';
import '../presentation/screens/user_details/user_details_binding.dart';

abstract class RoutesName {
  static const String home = '/home';
  static const String userDetails = '/userDetails';
}

abstract class AppScreens {
  static const String initialScreen = RoutesName.home;

  static final screenRoutes = [
    GetPage(
      name: RoutesName.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.userDetails,
      page: () => UserDetailsScreen(),
      binding: UserDetailsBinding(),
    ),
  ];
}
