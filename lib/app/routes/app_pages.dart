import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/package/bindings/package_binding.dart';
import '../modules/package/views/package_view.dart';
import '../modules/rate/bindings/rate_binding.dart';
import '../modules/rate/views/rate_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.PACKAGE,
    //   page: () =>PackageView(),
    //   binding: PackageBinding(),
    // ),
    GetPage(
      name: _Paths.RATE,
      page: () =>RateView(),
      binding: RateBinding(),
    ),
  ];
}
