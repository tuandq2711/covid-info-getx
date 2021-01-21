import 'package:get/get.dart';

import '../pages/home/bindings/country_binding.dart';
import '../pages/home/bindings/country_detail_binding.dart';
import '../pages/home/bindings/home_binding.dart';
import '../pages/home/presentation/views/country_view.dart';
import '../pages/home/presentation/views/details_view.dart';
import '../pages/home/presentation/views/home_view.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.COUNTRY,
      page: () => CountryView(),
      binding: CountryBinding(),
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => DetailsView(),
      binding: CountryDetailBinding(),
    ),
  ];
}
