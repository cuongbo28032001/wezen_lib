import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DialogIOS extends StatelessWidget {
  const DialogIOS({
    super.key,
    this.callbackRetry,
    required this.title,
    required this.content,
    this.btnRetry,
    this.btnSetting,
    this.callbackSetting,
    this.boxDecorationDialog,
  });

  final Text title;
  final Text content;
  final Text? btnRetry;
  final Text? btnSetting;
  final BoxDecoration? boxDecorationDialog;
  final Function? callbackRetry;
  final Function? callbackSetting;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.8.sw,
      decoration: boxDecorationDialog ??
          BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.sp),
              border: Border.all(color: Colors.black26, width: 0.6.h)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              children: [
                title,
                SizedBox(height: 2.h),
                content.paddingSymmetric(horizontal: 4.w),
              ],
            ),
          ),
          Container(height: 0.5.h, color: const Color(0xFFD4D7D8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () => callbackRetry?.call(),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: btnRetry,
                  ),
                ),
              )),
              Container(width: 0.5.h, color: const Color(0xFFD4D7D8)),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                    border: Border(
                  left: BorderSide(
                    color: const Color(0xFFD4D7D8), // left border color
                    width: 0.5.h, // left border width
                  ),
                )),
                child: GestureDetector(
                  onTap: () => callbackSetting?.call(),
                  child: Center(child: btnSetting),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
