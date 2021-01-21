import '../../../../api/model/news_model.dart';
import '../../../../shared/widget/web_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../api/adapters/repository_adapter.dart';
import '../../../../api/model/summary.dart';

enum Status { loading, success, error }

class HomeController extends GetxController {
  HomeController({this.homeRepository});

  final lstNews = <NewsModel>[].obs;

  /// inject repo abstraction dependency
  final IHomeRepository homeRepository;

  /// create a reactive status from request with initial value = loading
  final status = Status.loading.obs;

  /// create a reactive CasesModel. CasesModel().obs has same result
  final cases = Rx<Summary>();

  /// When the controller is initialized, make the http request
  @override
  Future<void> onInit() async {
    super.onInit();
    homeRepository.getNewsList().then((value) async {
      if (value.isNotEmpty) lstNews.assignAll(value);
      print(lstNews);
      await homeRepository.getCases().then(
        (data) {
          cases(data);
          status(Status.success);
        },
        onError: (err) {
          print("$err");
          status(Status.error);
        },
      );
    });
  }

  onTapCarouse(int index) {
    showCupertinoModalBottomSheet(
      expand: true,
      enableDrag: true,
      context: Get.context,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomWebView(url: lstNews[index].link),
    );
  }
}
