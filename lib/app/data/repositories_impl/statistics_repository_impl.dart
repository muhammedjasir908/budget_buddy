import 'package:budget_buddy/app/domain/repositories/statistics_repository.dart';

class StatisticsRepositoryImpl extends StatisticsRepository{

  @override
  Future getDailyStatistics(String uid,String date) {
    throw UnimplementedError();
  }

  @override
  Future getStatistics(String uid,String startDate,String endDate) {
    throw UnimplementedError();
  }

  @override
  Future getExpenseStatistics(String uid,String startDate,String endDate) {
    // TODO: implement getExpenseStatistics
    throw UnimplementedError();
  }

  @override
  Future getIncomeStatistics(String uid,String startDate,String endDate) {
    // TODO: implement getIncomeStatistics
    throw UnimplementedError();
  }

  @override
  Future getSpecificCategoryStatistics(String uid,String category,String startDate,String endDate) {
    // TODO: implement getSpecificCategoryStatistics
    throw UnimplementedError();
  }

}