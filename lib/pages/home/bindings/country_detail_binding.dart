import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../api/adapters/repository_adapter.dart';
import '../../../api/response/country_detail_repository.dart';
import '../../../pages/home/presentation/controllers/country_detail_controller.dart';
import '../../../shared/api_client/api_client.dart';

class CountryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(Dio()));
    Get.lazyPut<ICountryDetailRepository>(
      () => CountryDetailRepository(
        apiClient: Get.find(),
      ),
    );
    Get.lazyPut(
      () => CountryDetailController(
        repository: Get.find(),
      ),
    );
  }
}
