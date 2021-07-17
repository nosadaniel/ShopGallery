import 'dart:async';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  //this variable 0 = No Internet, 1 = connected to WIFI ,2 = connected to Mobile Data.
  var connectionType = 0.obs;
  var _listener;

  Future<DataConnectionStatus> dataConnection() async {
    _listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          Get.snackbar("Success", 'Data connection is available.');
          break;
        case DataConnectionStatus.disconnected:
          Get.snackbar('Error', 'You are disconnected from the internet.',
              backgroundColor: Color(0xFFFFCDD2));
          break;
      }
    });

    // close listener after 30 seconds, so the program doesn't run forever
    return await DataConnectionChecker().connectionStatus;
  }

  @override
  void onClose() {
    _listener.cancel();
    super.onClose();
  }
}
