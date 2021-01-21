import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../database/entity/country_item.dart';
import '../../../../pages/home/presentation/controllers/country_detail_controller.dart';
import '../../../../shared/languages/localization.dart';
import '../../../../shared/utils/formatter.dart';
import '../../../../shared/widget/app_bar.dart';

class DetailsView extends GetView<CountryDetailController> {
  @override
  Widget build(BuildContext context) {
    final country = Get.arguments as CountryItem;
    final labels = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.linearToSrgbGamma(),
          image: CachedNetworkImageProvider(country.countryInfo.flag),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.0),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: appBar(context, country.country),
            body: Center(
              child: Obx(
                () {
                  final status = controller.status.value;
                  if (status == Status.loading)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  if (status == Status.error)
                    return Center(
                      child: Text(labels.error.connectionFail),
                    );
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        labels.string.totalConfirmed,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        toNumber(controller.country.value.cases),
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        labels.string.totalDeaths,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        toNumber(controller.country.value.deaths),
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        labels.string.totalRecovery,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        toNumber(controller.country.value.recovered),
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Update time: " +
                            toDate(controller.country.value.updated),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
