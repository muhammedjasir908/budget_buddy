import 'package:budget_buddy/app/data/repositories_impl/auth_repository_impl.dart';
import 'package:budget_buddy/app/domain/entities/registered_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{

  TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future onForgotPasswordTap() async {
    final form = formKey.currentState!;
    if(form.validate()){
      await AuthRepositoryImpl().resetPassword(RegisteredUser(email: emailController.text.trim(),password: ''));
    }
  }
}