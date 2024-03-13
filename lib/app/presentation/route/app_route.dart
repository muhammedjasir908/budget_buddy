import 'package:budget_buddy/app/presentation/route/app_pages.dart';
import 'package:budget_buddy/app/presentation/screens/auth/change_password/change_password_screen.dart';
import 'package:budget_buddy/app/presentation/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:budget_buddy/app/presentation/screens/auth/otp_validation/otp_validation_screen.dart';
import 'package:budget_buddy/app/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:budget_buddy/app/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:budget_buddy/app/presentation/screens/home/home_screen.dart';

import 'package:get/get.dart';

class AppRoute{
  static final pages = [
    GetPage(name: AppPages.signIn, page:() => const SignInScreen()),
    GetPage(name: AppPages.signUp, page: () => const SignUpScreen()),
    GetPage(name: AppPages.forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: AppPages.otpValidation, page: () => const OTPValidationScreen()),
    GetPage(name: AppPages.changePassword, page: () => const ChangePasswordScreen()),
    GetPage(name: AppPages.home, page: () => const HomeScreen()),
  ];
}