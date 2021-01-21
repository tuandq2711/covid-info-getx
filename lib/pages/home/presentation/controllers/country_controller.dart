import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/adapters/repository_adapter.dart';
import '../../../../database/entity/country_item.dart';
import '../../../../shared/constants/strings.dart';
import '../../../../shared/utils/string_helper.dart';

enum Status { loading, success, error }

class CountryController extends GetxController {
  TextEditingController searchTextController;

  CountryController({this.countryRepository});

  /// inject repo abstraction dependency
  final ICountryRepository countryRepository;

  /// create a reactive status from request with initial value = loading
  final status = Status.loading.obs;

  /// create a reactive CasesModel. CasesModel().obs has same result
  final country = <CountryItem>[].obs;
  final filterType = StringCommon.filterName.obs;

  /// When the controller is initialized, make the http request
  @override
  Future<void> onInit() async {
    searchTextController = TextEditingController();
    super.onInit();
    getCountryList(0);
  }

  Future<void> getCountryList(int type) async {
    String text = searchTextController.text.toLowerCase();
    print("------------------------ $text");
    countryRepository.getListCountry(type).then(
      (data) async {
        var mData = data;
        mData = data
            .where((element) => element.country.toLowerCase().contains(text))
            .toList();
        country.assignAll(mData);
        status(Status.success);
      },
      onError: (err) {
        print("$err");
        status(Status.error);
      },
    );
  }

  filterListSearch(String value) {
    filterType.value = value;
    update();
    switch (filterType.value) {
      case StringCommon.filterName:
        country.sort((a, b) => ((a?.country ?? "").toLowerCase())
            .compareTo((b?.country ?? "").toLowerCase()));
        update();
        break;
      case StringCommon.totalRecovered:
        country.sort((a, b) =>
            StringHelper.convertStringValueToInt(b?.recovered.toString() ?? "0")
                .compareTo(StringHelper.convertStringValueToInt(
                    a?.recovered.toString() ?? "0")));
        update();
        break;
      case StringCommon.totalDeath:
        country.sort((a, b) =>
            StringHelper.convertStringValueToInt(b?.deaths.toString() ?? "0")
                .compareTo(StringHelper.convertStringValueToInt(
                    a?.deaths.toString() ?? "0")));
        update();
        break;
      case StringCommon.totalCase:
        country.sort((a, b) =>
            StringHelper.convertStringValueToInt(b?.cases.toString() ?? "0")
                .compareTo(StringHelper.convertStringValueToInt(
                    a?.cases.toString() ?? "0")));
        update();
        break;
      default:
    }
  }
}
