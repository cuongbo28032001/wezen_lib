import 'dart:io';
import 'package:flutter/material.dart';
import 'no_internet_dialog/no_internet_android.dart';
import 'no_internet_dialog/no_internet_ios.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.btnRetry,
    required this.btnSetting,
    required this.callbackRetry,
    required this.callbackSetting,
    this.backgroundColor,
    this.borderColor,
    this.titleStyle,
    this.contentStyle,
    this.boxDecorationBtnRetry,
    this.boxDecorationBtnSetting,
    this.boxDecorationDialog,
    this.btnWidth,
    this.btnPaddingHorizontal,
    this.btnPaddingVertical,
  });

  final Text title;
  final Text content;
  final Text btnRetry;
  final Text btnSetting;
  final Function? callbackRetry;
  final Function? callbackSetting;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final BoxDecoration? boxDecorationBtnRetry;
  final BoxDecoration? boxDecorationBtnSetting;
  final BoxDecoration? boxDecorationDialog;
  final double? btnWidth;
  final double? btnPaddingHorizontal;
  final double? btnPaddingVertical;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? DialogAndroid(
            content: content,
            title: title,
            btnRetry: btnRetry,
            btnSetting: btnSetting,
            callbackRetry: callbackRetry,
            callbackSetting: callbackSetting,
            boxDecorationDialog: boxDecorationDialog,
            boxDecorationBtnRetry: boxDecorationBtnRetry,
            boxDecorationBtnSetting: boxDecorationBtnSetting,
            btnPaddingHorizontal: btnPaddingHorizontal,
            btnPaddingVertical: btnPaddingVertical,
            btnWidth: btnWidth,
          )
        : DialogIOS(
            content: content,
            title: title,
            btnRetry: btnRetry,
            btnSetting: btnSetting,
            callbackRetry: callbackRetry,
            callbackSetting: callbackSetting,
            boxDecorationDialog: boxDecorationDialog,
          );
  }
}
