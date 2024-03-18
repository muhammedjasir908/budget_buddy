import 'package:budget_buddy/app/data/repositories_impl/auth_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{

  TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  onForgotPasswordTap() async {
    final form = formKey.currentState!;
    if(form.validate()){
      await AuthRepositoryImpl().resetPassword(emailController.text.trim());
    }
  }
}