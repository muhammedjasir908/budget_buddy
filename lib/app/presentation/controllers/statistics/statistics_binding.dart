import 'package:budget_buddy/app/presentation/controllers/statistics/statistics_controller.dart';
import 'package:get/get.dart';

class StatisticsBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<StatisticsController>(() => StatisticsController());
  }
}