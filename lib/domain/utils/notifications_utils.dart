import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSucces(String message) {
  Get.snackbar(
    'Success',
    message,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    margin: const EdgeInsets.all(16),
  );
}

void showError(String message) {
  Get.snackbar(
    'Error',
    message,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    margin: const EdgeInsets.all(16),
  );
}
