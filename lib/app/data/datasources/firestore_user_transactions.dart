import 'package:budget_buddy/app/data/models/user_transaction_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserTransactions{

  static final _fireStoreTransactionCollection = FirebaseFirestore.instance.collection('transactions');

  static Future<void> createTransaction(UserTransactionInfo newTransactionInfo) async {
    await _fireStoreTransactionCollection
        .doc(newTransactionInfo.userId)
        .collection('user_transactions')
        .doc(newTransactionInfo.transactionId)
        .set(newTransactionInfo.toMap());
  }

  // static Future<List<UserTransactionInfo>> getUserDailyTransaction({required String date,required String userId}) async {
  //   List<UserTransactionInfo> transactionInfo = [];
  //   DocumentReference<Map<String,dynamic>>? transactionCollection = _fireStoreTransactionCollection.doc(userId);
  //   QuerySnapshot<Map<String,dynamic>> snap = await transactionCollection
  //       .collection('user_transactions')
  //       .where('transactionDate',isEqualTo: date)
  //       .get();
  //   if(snap.docs.isNotEmpty){
  //     for(final doc in snap.docs){
  //       UserTransactionInfo userTransactionInfo = UserTransactionInfo.fromQuery(query: doc);
  //       transactionInfo.add(userTransactionInfo);
  //     }
  //   }
  //   return transactionInfo;
  // }

  static Future<List<UserTransactionInfo>> getUserTransaction({required String startDate,required String endDate,required String userId}) async {
    List<UserTransactionInfo> transactionInfo = [];
    DocumentReference<Map<String,dynamic>>? transactionCollection = _fireStoreTransactionCollection.doc(userId);
    QuerySnapshot<Map<String,dynamic>> snap = await transactionCollection
        .collection('user_transactions')
        .where('transactionDate',isGreaterThanOrEqualTo: startDate)
        .where('transactionDate',isLessThanOrEqualTo: endDate)
        .get();
    if(snap.docs.isNotEmpty){
      for(final doc in snap.docs){
        UserTransactionInfo userTransactionInfo = UserTransactionInfo.fromQuery(query: doc);
        transactionInfo.add(userTransactionInfo);
      }
    }
    return transactionInfo;
  }


}