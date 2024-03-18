import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories_impl/auth_repository_impl.dart';

class SignUpController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> onRegisterTap() async {
    final form = formKey.currentState!;
    if(form.validate()){
      User? userData = await AuthRepositoryImpl()
          .signUpWithEmail(
          emailController.text.trim(),
          passwordController.text.trim(), passwordController.text.trim());
      if(userData != null){
        log('data - ${userData.toString()}');
      }
    }
  }

}