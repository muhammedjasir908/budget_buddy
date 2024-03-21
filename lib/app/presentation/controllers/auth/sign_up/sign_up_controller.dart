import 'dart:developer';

import 'package:budget_buddy/app/domain/entities/registered_user.dart';
import 'package:budget_buddy/app/presentation/route/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories_impl/auth_repository_impl.dart';

class SignUpController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;

  final formKey = GlobalKey<FormState>();

  Future<void> onRegisterTap() async {
    final form = formKey.currentState!;
    if(form.validate()){
      User? userData = await AuthRepositoryImpl()
          .signUpWithEmail(RegisteredUser(
          email:emailController.text.trim(),
          password: passwordController.text.trim()));
        log('data - ${userData.toString()}');
        Get.toNamed(AppPages.addUserDetails,arguments: {
          'email':userData.email,
          'user_id':userData.uid
        });
    }
  }

  Future<void> onGoogleTap() async {
    await AuthRepositoryImpl().googleLogin();
  }

}