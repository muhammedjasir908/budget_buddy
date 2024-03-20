import 'package:budget_buddy/app/presentation/controllers/onboarding/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}