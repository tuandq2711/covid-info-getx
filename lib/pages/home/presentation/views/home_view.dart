import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/strings.dart';
import '../../../../shared/languages/localization.dart';
import '../../../../shared/utils/formatter.dart';
import '../../../../shared/widget/background.dart';
import '../../../../shared/widget/button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.linearToSrgbGamma(),
          image: AssetImage(StringCommon.bgCountry),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Background(
          child: Container(
            child: Obx(
              () {
                final status = controller.status.value;
                if (status == Status.loading)
                  return CircularProgressIndicator();
                if (status == Status.error)
                  return Text(labels.error.connectionFail);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.lstNews.length > 0
                        ? Container(
                            width: Get.width,
                            child: CarouselSlider.builder(
                              itemCount: controller.lstNews.length,
                              itemBuilder: (
                                BuildContext context,
                                int itemIndex,
                              ) {
                                return _carouseSliderItem(itemIndex);
                              },
                              options: CarouselOptions(
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 1000),
                                autoPlayInterval: Duration(milliseconds: 6000),
                                autoPlayCurve: Curves.easeInOut,
                                viewportFraction: 1.0,
                              ),
                            ),
                          )
                        : SizedBox(),
                    Text(
                      labels.string.totalConfirmed,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      toNumber(controller.cases.value.cases),
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      labels.string.totalDeaths,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      toNumber(controller.cases.value.deaths),
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Update time: ${controller.cases.value.timeUpdate}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonRounded(
                      labels.btn.fetchCountry,
                      widthButton: 0.5,
                      onPress: () {
                        debugPaintSizeEnabled = true;
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _carouseSliderItem(int itemIndex) {
    return Container(
      padding: EdgeInsets.only(bottom: 2),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3) // changes position of shadow
                ),
          ],
        ),
        child: InkWell(
          onTap: () {
            controller.onTapCarouse(itemIndex);
          },
          child: Container(
            height: Get.height * 0.4,
            child: Stack(
              children: <Widget>[
                __carouseSliderItemImage(itemIndex),
                __carouseSliderItemTitle(itemIndex),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget __carouseSliderItemTitle(int itemIndex) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 8, 32, 8),
        width: Get.width,
        color: Colors.black.withOpacity(0.8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(controller.lstNews[itemIndex].title,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text(controller.lstNews[itemIndex].pubDate,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  Widget __carouseSliderItemImage(int itemIndex) {
    return CachedNetworkImage(
      imageUrl: controller.lstNews[itemIndex].image,
      fit: BoxFit.cover,
      width: Get.width,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
        ),
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(
          Icons.error,
        ),
      ),
    );
  }
}
