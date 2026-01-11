import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../common_widgets/custom_text_field.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';


class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/png/bg.png',
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding:
                const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.s32),

                    Center(
                      child: Image.asset(
                        'assets/png/logo.png',
                        height: 121,
                      ),
                    ),

                    const SizedBox(height: AppSpacing.s24),

                    const Text(
                      'Sign Up To Betrhealth',
                      style: AppTextStyles.title,
                    ),

                    const SizedBox(height: AppSpacing.s8),

                    const Text(
                      'Your smart fitness journey starts here',
                      style: AppTextStyles.subtitle,
                    ),

                    const SizedBox(height: AppSpacing.s32),

                    const Text('Full Name', style: AppTextStyles.label),
                    const SizedBox(height: AppSpacing.s8),

                    CustomTextField(
                      hint: 'Alexandra',
                      iconPath: 'assets/png/icons/user.png',
                      controller: controller.nameCtrl,
                    ),

                    const SizedBox(height: AppSpacing.s16),

                    const Text('Email Address', style: AppTextStyles.label),
                    const SizedBox(height: AppSpacing.s8),

                    CustomTextField(
                      hint: 'alexandra@gmail.co',
                      iconPath: 'assets/png/icons/email.png',
                      controller: controller.emailCtrl,
                    ),

                    const SizedBox(height: AppSpacing.s16),

                    const Text('Password', style: AppTextStyles.label),
                    const SizedBox(height: AppSpacing.s8),

                    Obx(() => CustomTextField(
                      hint: '**********',
                      iconPath: 'assets/png/icons/lock.png',
                      controller: controller.passwordCtrl,
                      obscure: controller.obscurePassword.value,
                      suffix: GestureDetector(
                        onTap: controller.togglePassword,
                        child: Image.asset(
                          'assets/png/icons/unhide.png',
                          width: 22,
                        ),
                      ),
                    )),

                    const SizedBox(height: AppSpacing.s16),

                    const Text('Confirm Password',
                        style: AppTextStyles.label),
                    const SizedBox(height: AppSpacing.s8),

                    Obx(() => CustomTextField(
                      hint: '**********',
                      iconPath: 'assets/png/icons/lock.png',
                      controller:
                      controller.confirmCtrl,
                      obscure: controller.obscureConfirm.value,
                      suffix: GestureDetector(
                        onTap: controller.toggleConfirm,
                        child: Image.asset(
                          'assets/png/icons/unhide.png',
                          width: 22,
                        ),
                      ),
                    )),

                    const SizedBox(height: AppSpacing.s16),

                    Obx(() => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: controller.toggleTerms,
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(4),
                              border: Border.all(
                                color: const Color(0xFFEF4B2D),
                              ),
                              color: controller.acceptedTerms.value
                                  ? const Color(0xFFEF4B2D)
                                  : Colors.transparent,
                            ),
                            child: controller.acceptedTerms.value
                                ? const Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.white,
                            )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              text:
                              'By continuing, you agree to our ',
                              style: AppTextStyles.subtitle,
                              children: [
                                TextSpan(
                                  text:
                                  'Terms & conditions, Privacy & Cookie Policy.',
                                  style: AppTextStyles.link,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),

                    const SizedBox(height: AppSpacing.s24),

                    PrimaryButton(
                      title: 'Register',
                      onTap: controller.register,
                    ),

                    const SizedBox(height: AppSpacing.s24),

                    Center(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.SIGN_IN);
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: 'Already have an account? ',
                            style: AppTextStyles.subtitle,
                            children: [
                              TextSpan(
                                text: 'Sign In.',
                                style: AppTextStyles.link,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppSpacing.s24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
