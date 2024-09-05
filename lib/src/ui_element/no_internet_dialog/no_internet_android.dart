import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DialogAndroid extends StatelessWidget {
  const DialogAndroid(
      {super.key,
      this.callbackRetry,
      required this.title,
      required this.content,
      this.btnRetry,
      this.btnSetting,
      this.callbackSetting,
      this.boxDecorationBtnRetry,
      this.boxDecorationBtnSetting,
      this.boxDecorationDialog,
      this.btnWidth,
      this.btnPaddingHorizontal,
      this.btnPaddingVertical});

  final Text title;
  final Text content;
  final Text? btnRetry;
  final Text? btnSetting;
  final BoxDecoration? boxDecorationBtnRetry;
  final BoxDecoration? boxDecorationBtnSetting;
  final BoxDecoration? boxDecorationDialog;
  final Function? callbackRetry;
  final Function? callbackSetting;
  final double? btnWidth;
  final double? btnPaddingHorizontal;
  final double? btnPaddingVertical;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.h),
      decoration: boxDecorationDialog ??
          BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 0.6, color: Colors.black26)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          SizedBox(height: 16.h),
          content,
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => callbackRetry?.call(),
                child: Container(
                    width: btnWidth,
                    padding
                    : EdgeInsets.symmetric(
                        horizontal: btnPaddingHorizontal ?? 6.w, vertical: btnPaddingVertical ?? 4.h),
                    decoration: boxDecorationBtnRetry,
                    child: btnRetry),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () => callbackSetting?.call(),
                child: Container(
                    width: btnWidth,
                    padding
                    : EdgeInsets.symmetric(
                        horizontal: btnPaddingHorizontal ?? 6.w, vertical: btnPaddingVertical ?? 4.h),
                    decoration: boxDecorationBtnSetting,
                    child: btnSetting),
              )
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 10.w),
    );
  }
}
