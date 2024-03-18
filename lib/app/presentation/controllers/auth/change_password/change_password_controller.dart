import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories_impl/auth_repository_impl.dart';

class ChangePasswordController extends GetxController{

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String code = "";

  onForgotPasswordTap() async {
    final form = formKey.currentState!;
    if(form.validate()){
      await AuthRepositoryImpl().changePassword(passwordController.text.trim(),code);
    }
  }

}