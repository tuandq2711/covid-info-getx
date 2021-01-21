import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';

import '../../../../database/entity/country_item.dart';
import '../../../../pages/home/presentation/controllers/country_controller.dart';
import '../../../../shared/constants/palette.dart';
import '../../../../shared/constants/strings.dart';
import '../../../../shared/languages/localization.dart';
import '../../../../shared/utils/formatter.dart';
import '../../../../shared/widget/app_bar.dart';
import '../../../../shared/widget/text_input.dart';

class CountryView extends GetWidget<CountryController> {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.linearToSrgbGamma(),
          image: AssetImage(StringCommon.bgCountry),
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
            appBar: appBar(context, labels.title.country),
            resizeToAvoidBottomPadding: false,
            body: Obx(
              () {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: _headerSearch(context),
                        ),
                        _filterButton(),
                      ],
                    ),
                    _viewBody(labels)
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _viewBody(AppLocalizations_Labels labels) {
    final status = controller.status.value;
    if (status == Status.loading)
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    if (status == Status.error)
      return Center(
        child: Text(labels.error.connectionFail),
      );
    return Expanded(
      child: ListView.builder(
        itemCount: controller.country.length,
        itemBuilder: (context, index) {
          final country = controller.country[index];
          return _itemViewCountry(context, country, labels);
        },
      ),
    );
  }

  Widget _itemViewCountry(BuildContext context, CountryItem country,
      AppLocalizations_Labels labels) {
    return ListTile(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        Get.toNamed('/details', arguments: country);
      },
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
          country.countryInfo.flag,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        size: 30,
      ),
      title: Text(country.country),
      subtitle:
          Text("${labels.string.totalInfected}: ${toNumber(country.cases)}"),
    );
  }

  Widget _filterButton() {
    return Container(
      width: 45,
      height: 45,
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      child: FocusedMenuHolder(
        onPressed: () {},
        blurSize: 2.0,
        menuItemExtent: 45,
        menuBoxDecoration: BoxDecoration(
          color: Palette.facebookBlue,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        duration: Duration(milliseconds: 100),
        animateMenuItems: true,
        blurBackgroundColor: Palette.facebookBlue,
        openWithTap: true,
        // Open Focused-Menu on Tap rather than Long Press
        menuOffset: 15,
        bottomOffsetHeight: 0,
        child: Container(
          width: 45,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.sort,
                color: Palette.facebookBlue,
                size: 25,
              ),
            ],
          ),
        ),
        menuItems: [
          customFocusedMenuItem(
            text: StringCommon.filterName,
            iconUrl: StringCommon.iconLoadCovid,
          ),
          customFocusedMenuItem(
            text: StringCommon.totalCase,
            iconUrl: StringCommon.iconTotalCase,
          ),
          customFocusedMenuItem(
            text: StringCommon.totalDeath,
            iconUrl: StringCommon.iconTotalDeath,
          ),
          customFocusedMenuItem(
            text: StringCommon.totalRecovered,
            iconUrl: StringCommon.icontotalRecovered,
          ),
        ],
      ),
    );
  }

  ///header (search view)
  Widget _headerSearch(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
      ),
      child: TextInput(
          hintText: "Nhập tên hoặc mã quốc gia",
          controller: controller.searchTextController,
          onchange: (text) {
            controller.getCountryList(1);
          },
          onSubmit: (text) {
            FocusScope.of(context).requestFocus(new FocusNode());
            controller.getCountryList(1);
          },
          prefixIcon: Icons.search_outlined),
    );
  }

  FocusedMenuItem customFocusedMenuItem({String iconUrl, String text}) {
    return FocusedMenuItem(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20.0,
            width: 20.0,
            child: SvgPicture.asset(iconUrl),
          ),
          SizedBox(width: 8.0),
          Text(
            text,
            style: TextStyle(
              color: controller.filterType.value == text
                  ? Colors.red
                  : Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      onPressed: () {
        controller.filterListSearch(text);
      },
    );
  }
}
