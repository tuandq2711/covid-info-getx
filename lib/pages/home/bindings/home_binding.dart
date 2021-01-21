import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../api/adapters/repository_adapter.dart';
import '../../../api/response/home_repository.dart';
import '../../../database/hive.dart';
import '../../../shared/api_client/api_client.dart';
import '../presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(Dio()));
    Get.lazyPut(() => HiveDatabase());
    Get.lazyPut<IHomeRepository>(
        () => HomeRepository(apiClient: Get.find(), hiveDatabase: Get.find()));
    Get.lazyPut(() => HomeController(homeRepository: Get.find()));
  }
}
