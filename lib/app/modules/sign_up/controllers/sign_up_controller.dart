import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../features/auth/auth_repository.dart';

class SignUpController extends GetxController {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();
  final obscurePassword = true.obs;
  final obscureConfirm = true.obs;
  final acceptedTerms = false.obs;

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirm() {
    obscureConfirm.value = !obscureConfirm.value;
  }

  void toggleTerms() {
    acceptedTerms.value = !acceptedTerms.value;
  }

  final repo = AuthRepository();

  void register() async {
    if (nameCtrl.text.isEmpty ||
        emailCtrl.text.isEmpty ||
        passwordCtrl.text.length < 6 ||
        passwordCtrl.text != confirmCtrl.text) {
      Get.snackbar('Error', 'Invalid input');
      return;
    }

    try {
      await repo.signup(
        nameCtrl.text.trim(),
        emailCtrl.text.trim(),
        passwordCtrl.text,
      );
      Get.snackbar('Success', 'Account created');
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'Email already exists');
    }
  }
}
