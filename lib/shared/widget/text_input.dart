import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/constants/palette.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool pass;
  final Function(String) validator;
  final Function onchange;
  final Function onTap;
  final ValueChanged<String> onSubmit;
  final IconData prefixIcon;
  final IconButton suffixIcon;
  final TextInputType inputType;
  final int maxLine;
  final int length;
  final FocusNode focusNode;

  TextInput({
    this.onSubmit,
    this.hintText,
    this.controller,
    this.pass = false,
    this.validator,
    this.onchange,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.inputType = TextInputType.text,
    this.maxLine = 1,
    this.length,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    FocusNode fieldNode = FocusNode();
    if (focusNode != null) fieldNode = focusNode;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
      padding: EdgeInsets.only(right: 10),
      height: 45,
      child: TextFormField(
        focusNode: fieldNode,
        obscureText: pass,
        controller: controller,
        maxLines: maxLine,
        maxLength: length,
        keyboardType: inputType,
        style: TextStyle(fontSize: AppSize.tsLager),
        onFieldSubmitted: (text) {
          if (onSubmit != null) {
            onSubmit(text);
          }
        },
        onChanged: (text) {
          if (onchange != null) {
            onchange(text);
          }
        },
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        decoration: InputDecoration(
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: Icon(
            prefixIcon,
            color: Palette.colorAppbar,
            size: 25,
          ),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(5),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Palette.colorGray,
            fontSize: AppSize.tsNormal,
          ),
          errorStyle: TextStyle(
            fontSize: AppSize.tsLager,
            fontWeight: FontWeight.w900,
            color: Palette.colorRed,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Color(0xff303FA2), width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Color(0xffC2D9FE), width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Color(0xffBFC4D3), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Color(0xffC2D9FE), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Palette.colorRed, width: 0.8),
          ),
        ),
        validator: (val) {
          if (validator == null) {
            return null;
          }
          return validator(val);
        },
      ),
    );
  }
}

class TextInputBorder extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool pass;
  final Function(String) validator;
  final Function onchange;
  final Function onTap;
  final IconData prefixIcon;
  final Icon suffixIcon;
  final bool check;
  final EdgeInsets edgeInsetsPadding;
  final TextInputType inputType;
  final int maxLine;
  final int length;
  final FocusNode focusNode;

  TextInputBorder(
      {this.hintText,
      this.controller,
      this.pass,
      this.validator,
      this.onchange,
      this.onTap,
      this.prefixIcon,
      this.suffixIcon,
      this.check,
      this.edgeInsetsPadding,
      this.inputType,
      this.maxLine,
      this.length,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    FocusNode fieldNode = FocusNode();
    if (focusNode != null) fieldNode = focusNode;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
      child: TextFormField(
        focusNode: fieldNode,
        obscureText: pass != null ? pass : false,
        controller: controller != null ? controller : null,
        maxLines: maxLine != null ? maxLine : 1,
        maxLength: (length != null) ? length : null,
        keyboardType: inputType != null ? inputType : TextInputType.text,
        style: TextStyle(
          fontSize: AppSize.tsLager,
        ),
        onChanged: (text) {
          onchange();
        },
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        decoration: InputDecoration(
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: Palette.colorAppbar,
                  size: 30,
                )
              : null,
          fillColor: Colors.white,
          contentPadding: edgeInsetsPadding == null
              ? EdgeInsets.only(left: 10.0, bottom: 5.0, top: 5.0)
              : edgeInsetsPadding,
          hintText: hintText,
          errorStyle: TextStyle(
            fontSize: AppSize.tsNormal,
            fontWeight: FontWeight.w900,
            color: Palette.colorRed,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Color(0xff303FA2), width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Color(0xffC2D9FE), width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Color(0xffBFC4D3), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Color(0xffC2D9FE), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Palette.colorRed, width: 0.8),
          ),
        ),
        validator: (val) {
          if (validator == null) {
            return null;
          }
          return validator(val);
        },
      ),
    );
  }
}
