import 'package:budget_buddy/app/presentation/controllers/auth/sign_in/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SignInController>(() => SignInController());
  }
}