import 'package:budget_buddy/app/presentation/controllers/auth/sign_up/sign_up_controller.dart';
import 'package:budget_buddy/app/presentation/route/app_pages.dart';
import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:budget_buddy/res/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../res/colors.dart';
import '../../../widgets/card_button_widget.dart';
import '../../../widgets/icon_card_button_widget.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Sign Up',
          style: GoogleFonts.poppins(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 25,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Image.asset(
                appImage,
                height: 50,
                width: 100,
              ),
              const SpaceWidget(
                height: 10,
              ),
              TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid email.';
                  }
                  return null;
                },
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  hintText: 'Please enter email here',
                  hintStyle:
                      GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SpaceWidget(
                height: 10.0,
              ),
              TextFormField(
                controller: controller.passwordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid password.';
                  }
                  return null;
                },
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                obscuringCharacter: '*',
                obscureText: controller.isPasswordVisible.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.isPasswordVisible.value =
                            !controller.isPasswordVisible.value;
                      },
                      icon: const Icon(
                        Icons.visibility,
                        size: 15,
                      )),
                  hintText: 'Please enter password here',
                  hintStyle:
                      GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SpaceWidget(
                height: 10.0,
              ),
              TextFormField(
                controller: controller.confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid password.';
                  } else if (value != controller.passwordController.text) {
                    return 'Please enter above entered password.';
                  }
                  return null;
                },
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                obscuringCharacter: '*',
                obscureText: controller.isConfirmPasswordVisible.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.isConfirmPasswordVisible.value =
                            !controller.isConfirmPasswordVisible.value;
                      },
                      icon: const Icon(
                        Icons.visibility,
                        size: 15,
                      )),
                  hintText: 'Please enter confirm password here',
                  hintStyle:
                      GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SpaceWidget(
                height: 10.0,
              ),
              CardButtonWidget(
                isLoading: false,
                buttonColor: Colors.red,
                text: 'SIGN UP',
                onTap: () async =>
                  await controller.onRegisterTap(),
              ),
              const SpaceWidget(
                height: 15.0,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Divider(
                    color: Colors.white,
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'or',
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.white),
                    ),
                  ),
                  const Expanded(
                      child: Divider(
                    color: Colors.white,
                  ))
                ],
              ),
              const SpaceWidget(
                height: 15.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconCardButtonWidget(size: 30, image: googleIcon),
                ],
              ),
              const SpaceWidget(
                height: 15.0,
              ),
              const Divider(
                color: Colors.white,
              ),
              const SpaceWidget(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style:
                        GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
