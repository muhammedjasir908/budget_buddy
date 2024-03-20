abstract class StatisticsRepository{

  Future getDailyStatistics(String uid,String date);

  Future getStatistics(String uid,String startDate,String endDate);

  Future getSpecificCategoryStatistics(String uid,String category,String startDate,String endDate);

  Future getExpenseStatistics(String uid,String startDate,String endDate);

  Future getIncomeStatistics(String uid,String startDate,String endDate);
}