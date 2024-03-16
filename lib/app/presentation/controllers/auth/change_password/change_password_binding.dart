import 'package:budget_buddy/app/presentation/controllers/auth/change_password/change_password_controller.dart';
import 'package:get/get.dart';

class ChangePasswordBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordController());
  }
}