import 'package:get/get.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/user_details/user_details.dart';

abstract class RoutesName {
  static const String home = '/home';
  static const String userDetails = '/userDetails';
}

abstract class AppScreens {
  static const String initialScreen = RoutesName.home;

  static final screenRoutes = [
    GetPage(
      name: RoutesName.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RoutesName.userDetails,
      page: () => const UserDetailsScreen(),
    ),
  ];
}
