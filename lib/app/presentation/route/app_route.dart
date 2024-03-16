import 'package:budget_buddy/app/presentation/controllers/main/main_binding.dart';
import 'package:budget_buddy/app/presentation/route/app_pages.dart';
import 'package:budget_buddy/app/presentation/screens/add_transaction/add_transaction_screen.dart';
import 'package:budget_buddy/app/presentation/screens/auth/change_password/change_password_screen.dart';
import 'package:budget_buddy/app/presentation/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:budget_buddy/app/presentation/screens/auth/otp_validation/otp_validation_screen.dart';
import 'package:budget_buddy/app/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:budget_buddy/app/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:budget_buddy/app/presentation/screens/category/category_screen.dart';
import 'package:budget_buddy/app/presentation/screens/home/home_screen.dart';
import 'package:budget_buddy/app/presentation/screens/main/main_screen.dart';
import 'package:budget_buddy/app/presentation/screens/settings/settings_screen.dart';
import 'package:budget_buddy/app/presentation/screens/transaction_details/transaction_detail_screen.dart';
import 'package:budget_buddy/app/presentation/screens/transactions/transactions_screen.dart';

import 'package:get/get.dart';

class AppRoute{
  static final pages = [
    GetPage(name: AppPages.signIn, page:() => const SignInScreen()),
    GetPage(name: AppPages.signUp, page: () => const SignUpScreen()),
    GetPage(name: AppPages.forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: AppPages.otpValidation, page: () => const OTPValidationScreen()),
    GetPage(name: AppPages.changePassword, page: () => const ChangePasswordScreen()),
    GetPage(name: AppPages.main, page: () => const MainScreen(), binding: MainBinding()),
    GetPage(name: AppPages.home, page: () => const HomeScreen()),
    GetPage(name: AppPages.category, page: () => const CategoryScreen()),
    GetPage(name: AppPages.transaction, page: () => const TransactionsScreen()),
    GetPage(name: AppPages.transactionDetails, page: () => const TransactionDetailScreen()),
    GetPage(name: AppPages.addTransaction, page: () => const AddTransactionScreen()),
    GetPage(name: AppPages.settings, page: () => const SettingScreen())
  ];
}