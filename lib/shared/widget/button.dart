import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/strings.dart';

class ButtonRounded extends StatelessWidget {
  final String title;
  final String image;
  final Color colorText;
  final double heightButton;
  final double widthButton;
  final Function onPress;
  final Decoration decoration;

  const ButtonRounded(
    this.title, {
    this.image,
    this.colorText,
    this.heightButton,
    this.widthButton,
    this.onPress,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height *
        (heightButton != null ? heightButton : 0.07);
    var width = MediaQuery.of(context).size.width *
        (widthButton != null ? widthButton : 1);
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          if (onPress != null) {
            onPress();
          }
        },
        child: Container(
          decoration: decoration == null ? mDecoration() : decoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              image == null
                  ? Container()
                  : Container(
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      child: Image.asset(
                        image == null ? StringCommon.bgHome : image,
                        width: image == null ? 0 : 20,
                        height: image == null ? 0 : 20,
                        fit: BoxFit.cover,
                      ),
                    ),
              Container(
                // padding: EdgeInsets.symmetric(
                //     vertical: image == null
                //         ? 0 : (MediaQuery.of(context).size.height * heightButton) * 0.3),
                child: Text(
                  title,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 18,
                      color: colorText != null ? colorText : Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Decoration mDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(40.0),
      color: Colors.white,
      gradient: new LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 136, 34),
          Color.fromARGB(255, 255, 177, 41)
        ],
      ),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 3,
          offset: Offset(-1, 5),
        ),
      ],
    );
  }
}
