import 'package:flutter/material.dart';

abstract class SnackMixin {
  void showError(BuildContext context, String e) {
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSuccess(BuildContext context, String message) {
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}