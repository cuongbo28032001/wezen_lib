import 'dart:async';
import 'dart:developer' as developer;
import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'ui_element/base_dialog.dart';
import 'ui_element/custom_dialog.dart';

class NetworkConnectionDialog extends GetxService {
  final Text title;
  final Text content;
  final Text btnCancel;
  final Text btnSetting;
  final TextStyle titleStyle;
  final TextStyle contentStyle;
  final BoxDecoration? boxDecorationBtnRetry;
  final BoxDecoration? boxDecorationBtnSetting;
  final BoxDecoration? boxDecorationDialog;
  final Function? callbackRetry;
  final Function? callbackSetting;
  final double? btnWidth;
  final double? btnPaddingHorizontal;
  final double? btnPaddingVertical;

  NetworkConnectionDialog({
    required this.title,
    required this.content,
    required this.btnCancel,
    required this.btnSetting,
    required this.titleStyle,
    required this.contentStyle,
    this.boxDecorationBtnRetry,
    this.boxDecorationBtnSetting,
    this.boxDecorationDialog,
    this.callbackRetry,
    this.callbackSetting,
    this.btnWidth,
    this.btnPaddingHorizontal,
    this.btnPaddingVertical,
  });

  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  RxBool isShow = RxBool(false);
  RxBool isConnectNetwork = RxBool(false);
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  Future<void> updateConnectionStatus(List<ConnectivityResult> result) async {
    late List<ConnectivityResult> result0;
    try {
      result0 = await _connectivity.checkConnectivity();
      isConnectNetwork.value = !result0.contains(ConnectivityResult.none);
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }
    _connectionStatus = result0;
    if (_connectionStatus.contains(ConnectivityResult.none)) {
      isShow.value = true;
      if (Get.context != null) {
        BaseDialog.showGenerateDialog(
          context: Get.context!,
          childWidget: CustomDialog(
            title: title,
            content: content,
            btnRetry: btnCancel,
            btnSetting: btnSetting,
            boxDecorationBtnRetry: boxDecorationBtnRetry,
            boxDecorationBtnSetting: boxDecorationBtnSetting,
            boxDecorationDialog: boxDecorationDialog,
            btnPaddingHorizontal: btnPaddingHorizontal,
            btnPaddingVertical: btnPaddingVertical,
            btnWidth: btnWidth,
            callbackRetry: () {
              Get.back();
              isShow.value = false;
              BaseDialog.showGenerateDialog(
                  context: Get.context!,
                  childWidget: const CircularProgressIndicator(),
                  isAllowCloseOutSize: false);
              Future.delayed(const Duration(seconds: 3), () {
                Get.back();
                updateConnectionStatus(result0);
              });
            },
            callbackSetting: () =>
                AppSettings.openAppSettings(type: AppSettingsType.device),
          ),
          allowWillPop: false,
          isAllowCloseOutSize: false,
        );
      }
    } else if (isShow.value == true) {
      Get.back();
      isShow.value = false;
    }
  }
}
