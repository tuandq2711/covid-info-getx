import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../api/adapters/repository_adapter.dart';
import '../../../api/response/country_repository.dart';
import '../../../database/hive.dart';
import '../../../pages/home/presentation/controllers/country_controller.dart';
import '../../../shared/api_client/api_client.dart';

class CountryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(Dio()));
    Get.lazyPut(() => HiveDatabase());
    Get.lazyPut<ICountryRepository>(() =>
        CountryRepository(apiClient: Get.find(), hiveDatabase: Get.find()));
    Get.lazyPut(() => CountryController(countryRepository: Get.find()));
  }
}
