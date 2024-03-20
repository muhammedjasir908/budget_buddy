abstract class TransactionRepository{

  Future<void> getDailyTransactions(String uid,String date);

  Future getTransactions(String uid, String startDate,String endDate);

  Future<void> addTransaction(String uid);

  Future getRecentTransactions(String uid);

  Future getSpecificCategoryTransactions(String uid,String category, String startDate,String endDate);

  Future getExpenseOrIncomeTransactions(String uid,String startDate,String endDate,String type);

}