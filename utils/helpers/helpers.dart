import 'package:admin_panel/utils/const/colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AHelpers {
  //snack bar
  static void showSnackBar(String message) {
    //reduce sized

    Get.snackbar(
      maxWidth: 450,
      'Alert',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AColors.primaryColor,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
    );
  }
}
