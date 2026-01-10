import 'package:betr_health/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../features/auth/auth_repository.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final obscure = true.obs;

  void togglePassword() {
    obscure.value = !obscure.value;
  }


  final repo = AuthRepository();

  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Fill all fields');
      return;
    }

    final user = await repo.login(
      emailController.text.trim(),
      passwordController.text,
    );

    if (user == null) {
      Get.snackbar('Error', 'Invalid credentials');
    } else {
      Get.snackbar('Success', 'Welcome ${user.name}');
      // Navigate to dashboard
    }
  }

  Future<void> signIn() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Fill all fields');
      return;
    }

    final user = await repo.login(
      emailController.text.trim(),
      passwordController.text,
    );

    if (user == null) {
      Get.snackbar('Error', 'Invalid credentials');
    } else {
      Get.snackbar('Success', 'Welcome ${user.name}');
      Get.offAllNamed(Routes.DASHBOARD);
    }  }
}
