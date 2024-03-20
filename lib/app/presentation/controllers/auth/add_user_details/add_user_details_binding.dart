import 'package:budget_buddy/app/presentation/controllers/auth/add_user_details/add_user_details_controller.dart';
import 'package:get/get.dart';

class AddUserDetailsBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AddUserDetailsController());
  }
}