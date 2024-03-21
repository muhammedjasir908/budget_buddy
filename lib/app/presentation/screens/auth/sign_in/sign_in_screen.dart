import 'package:budget_buddy/app/presentation/controllers/auth/sign_in/sign_in_controller.dart';
import 'package:budget_buddy/app/presentation/route/app_pages.dart';
import 'package:budget_buddy/app/presentation/widgets/card_button_widget.dart';
import 'package:budget_buddy/app/presentation/widgets/icon_card_button_widget.dart';
import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:budget_buddy/res/colors.dart';
import 'package:budget_buddy/res/images.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: darkColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Sign In'.toUpperCase(),
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: const SizedBox()),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                appImage,
                width: 100,
                height: 70,
                fit: BoxFit.contain,
              ),
              const SpaceWidget(
                height: 10.0,
              ),
              TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid email address.';
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
                    color: Colors.white,
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
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password.';
                    }
                    return null;
                  },
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                  obscureText: controller.isPasswordVisible.value,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      size: 15,
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.isPasswordVisible.value =
                              !controller.isPasswordVisible.value;
                        },
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 15,
                          color: Colors.white,
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
              ),
              const SpaceWidget(
                height: 10.0,
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(AppPages.forgotPassword);
                  },
                  child: Text(
                    'Forgot password',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  )),
              const SpaceWidget(
                height: 5.0,
              ),
              Obx(
                () => CardButtonWidget(
                  isLoading: controller.isLoading.value,
                  buttonColor: Colors.red,
                  text: 'LOGIN',
                  onTap: () async => await controller.onLoginTap(),
                ),
              ),
              const SpaceWidget(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                      child: Divider(
                    color: Colors.white,
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'or',
                      style: GoogleFonts.poppins(color: Colors.white),
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
                children: [
                  IconCardButtonWidget(size: 30, image: googleIcon),
                  SizedBox(width: 40),
                  IconCardButtonWidget(size: 30, image: facebookIcon)
                ],
              ),
              const SpaceWidget(
                height: 15.0,
              ),
              const Divider(
                color: Colors.white,
              ),
              const SpaceWidget(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style:
                        GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(AppPages.signUp);
                      },
                      child: Text(
                        'Sign Up',
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
