import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelpers {
  // show dialog
  static void showErrorDialog({required String title, required String body}) {
    Get.dialog(Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            body,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    ));
  }
}
