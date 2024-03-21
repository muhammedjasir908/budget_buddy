import 'dart:developer';

import 'package:budget_buddy/app/data/repositories_impl/auth_repository_impl.dart';
import 'package:budget_buddy/app/domain/entities/registered_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  RxBool isPasswordVisible = true.obs;

  RxBool isLoading = false.obs;

  Future<void> onLoginTap() async {
    final form = formKey.currentState!;
    if(form.validate()){
      isLoading.value = true;
      User? userData = await AuthRepositoryImpl()
          .singInWithEmail(
          RegisteredUser(
              email: emailController.text.trim(),
              password: passwordController.text.trim()
          ));
      isLoading.value = false;
        log('data - ${userData.toString()}');
    }
  }

  Future<void> onGoogleTap() async {
    await AuthRepositoryImpl().googleLogin();
  }
}