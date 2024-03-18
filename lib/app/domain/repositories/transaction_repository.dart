abstract class TransactionRepository{

  Future<void> getTransactions();

  Future<void> addTransaction();
}