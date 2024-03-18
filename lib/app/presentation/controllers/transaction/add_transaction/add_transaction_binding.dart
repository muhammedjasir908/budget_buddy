import 'package:budget_buddy/app/presentation/controllers/transaction/add_transaction/add_transaction_controller.dart';
import 'package:get/get.dart';

class AddTransactionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AddTransactionController>(() => AddTransactionController());
  }
}