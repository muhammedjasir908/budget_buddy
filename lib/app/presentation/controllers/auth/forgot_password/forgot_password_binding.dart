import 'package:budget_buddy/app/presentation/controllers/auth/forgot_password/forgot_password_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}