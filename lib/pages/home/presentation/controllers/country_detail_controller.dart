import 'package:get/get.dart';

import '../../../../api/adapters/repository_adapter.dart';
import '../../../../database/entity/country_item.dart';

enum Status { loading, success, error }

class CountryDetailController extends GetxController {
  CountryDetailController({this.repository});

  /// inject repo abstraction dependency
  final ICountryDetailRepository repository;

  /// create a reactive status from request with initial value = loading
  final status = Status.loading.obs;

  /// create a reactive CasesModel. CasesModel().obs has same result
  final country = Rx<CountryItem>();

  /// When the controller is initialized, make the http request
  @override
  Future<void> onInit() async {
    super.onInit();
    final item = Get.arguments as CountryItem;
    print("--------------------------------------------- " + item.country);
    getCountry(item.country);
  }

  Future<void> getCountry(String country) async {
    repository.getCountryDetail(country).then(
      (data) async {
        this.country(data);
        status(Status.success);
      },
      onError: (err) {
        print("$err");
        status(Status.error);
      },
    );
  }
}
