import 'dart:developer';

import 'package:budget_buddy/app/data/repositories_impl/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> onLoginTap() async {
    final form = formKey.currentState!;
    if(form.validate()){
      User? userData = await AuthRepositoryImpl()
          .singInWithEmail(
          emailController.text.trim(),
          passwordController.text.trim());
      if(userData != null){
        log('data - ${userData.toString()}');
      }
    }
  }
}