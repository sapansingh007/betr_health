import 'package:betr_health/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../common_widgets/custom_text_field.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.obscure.value;
      return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset('assets/png/bg.png', fit: BoxFit.cover),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppSpacing.s32),
        
                      Center(
                        child: Image.asset('assets/png/logo.png', height: 121),
                      ),
        
                      const SizedBox(height: AppSpacing.s24),
        
                      const Text(
                        'Sign In To Betrhealth',
                        style: AppTextStyles.title,
                      ),
        
                      const SizedBox(height: AppSpacing.s8),
        
                      const Text(
                        'Your smart fitness journey starts here',
                        style: AppTextStyles.subtitle,
                      ),
        
                      const SizedBox(height: AppSpacing.s32),
        
                      const Text('Email Address', style: AppTextStyles.label),
                      const SizedBox(height: AppSpacing.s8),
        
                      CustomTextField(
                        hint: 'alexandra@gmail.co',
                        iconPath: 'assets/png/icons/email.png',
                        controller: controller.emailController,
                      ),
        
                      const SizedBox(height: AppSpacing.s16),
        
                      const Text('Password', style: AppTextStyles.label),
                      const SizedBox(height: AppSpacing.s8),
        
                      Obx(
                        () => CustomTextField(
                          hint: '**********',
                          iconPath: 'assets/png/icons/lock.png',
                          controller: controller.passwordController,
                          obscure: controller.obscure.value,
                          suffix: GestureDetector(
                            onTap: controller.togglePassword,
                            child: Image.asset(
                              'assets/png/icons/unhide.png',
                              width: 22,
                            ),
                          ),
                        ),
                      ),
        
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password',
                            style: AppTextStyles.link,
                          ),
                        ),
                      ),
        
                      const SizedBox(height: AppSpacing.s16),
        
                      PrimaryButton(title: 'Sign In', onTap: controller.signIn),
        
                      const Spacer(),
        
                      Center(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.SIGN_UP);
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: "Don't have an account? ",
                              style: AppTextStyles.subtitle,
                              children: [
                                TextSpan(
                                  text: 'Sign Up.',
                                  style: AppTextStyles.link,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
        
                      const SizedBox(height: AppSpacing.s16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
