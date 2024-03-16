import 'package:budget_buddy/app/presentation/controllers/auth/otp_validation/otp_validation_controller.dart';
import 'package:get/get.dart';

class OTPValidationBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<OTPValidationController>(() => OTPValidationController());
  }
}