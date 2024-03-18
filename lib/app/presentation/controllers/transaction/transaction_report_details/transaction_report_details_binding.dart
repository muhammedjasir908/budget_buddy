import 'package:budget_buddy/app/presentation/controllers/transaction/transaction_report_details/transaction_report_details_controller.dart';
import 'package:get/get.dart';

class TransactionReportDetailsBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TransactionReportDetailsController>(() => TransactionReportDetailsController());
  }
}