import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/palette.dart';
import '../../shared/widget/text_title.dart';

Widget appBar(BuildContext context, String title) {
  return new AppBar(
    title: TextTitle(
      textTitle: title,
      colorText: Palette.scaffold,
      textSize: 18,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Palette.colorAppbar,
    elevation: 0,
    centerTitle: true,
    automaticallyImplyLeading: true,
  );
}
