import '../constants/palette.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final Key key;
  final String textTitle;
  final Color colorText;
  final double textSize;
  final FontWeight fontWeight;
  final Function onPress;
  final TextAlign textAlign;

  TextTitle({
    this.key,
    @required this.textTitle,
    this.colorText,
    this.textSize,
    this.fontWeight,
    this.onPress,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          if (onPress != null) {
            onPress();
          }
        },
        child: Text(
          textTitle,
          textAlign: textAlign != null ? textAlign : TextAlign.start,
          style: TextStyle(
            color: colorText != null ? colorText : Palette.black,
            fontSize: textSize != null ? textSize : 16,
            fontWeight: fontWeight != null ? fontWeight : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
