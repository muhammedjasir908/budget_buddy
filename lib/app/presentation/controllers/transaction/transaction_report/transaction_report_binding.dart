import 'package:budget_buddy/app/presentation/controllers/transaction/transaction_report/transaction_report_controller.dart';
import 'package:get/get.dart';

class TransactionReportBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TransactionReportController>(() => TransactionReportController());
  }
}