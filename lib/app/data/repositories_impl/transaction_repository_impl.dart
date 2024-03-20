import 'dart:developer';

import 'package:budget_buddy/app/domain/repositories/transaction_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionRepositoryImpl extends TransactionRepository{
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<void> addTransaction(String uid) async {
    try {
      var transactionData = await _db.collection('transactions').doc(uid).get();
      log('response - ${transactionData.data()}');
    } catch (e){
      print(e.toString());
    }
  }

  @override
  Future<void> getDailyTransactions(String uid, String date) async {
    try{
      var transactionData = await _db.collection('transactions')
          .where('uid',isEqualTo: uid)
          .where('transaction_date',isEqualTo: date)
          .get();
      log('response - $transactionData');
    }catch (e){
      print(e);
    }
  }

  @override
  Future getExpenseOrIncomeTransactions(String uid, String startDate, String endDate,String type) async {
    try{
      var transactionData = await _db.collection('transactions')
          .where('uid',isEqualTo: uid)
          .where('transaction_date',isGreaterThanOrEqualTo: startDate)
          .where('transaction_date',isLessThanOrEqualTo: endDate)
          .where('type',isEqualTo: type)
          .get();
      log('response - $transactionData');
    }catch (e){
      print(e);
    }
  }

  @override
  Future getTransactions(String uid, String startDate, String endDate) async {
    try{
      var transactionData = await _db.collection('transactions')
          .where('uid',isEqualTo: uid)
          .where('transaction_date',isGreaterThanOrEqualTo: startDate)
          .where('transaction_date',isLessThanOrEqualTo: endDate)
          .get();
      log('response - $transactionData');
    }catch (e){
      print(e);
    }
  }

  @override
  Future getRecentTransactions(String uid) async {
    try{
      var transactionData = await _db.collection('transactions')
          .where('uid',isEqualTo: uid)
          .orderBy('transaction_date',descending: true)
          .limit(5)
          .get();
      log('response - ${transactionData.docs}');
    }catch (e){
      print(e);
    }
  }

  @override
  Future getSpecificCategoryTransactions(String uid, String category, String startDate, String endDate) async {
    try{
      var transactionData = await _db.collection('transactions')
          .where('uid',isEqualTo: uid)
          .where('transaction_date',isGreaterThanOrEqualTo: startDate)
          .where('transaction_date',isLessThanOrEqualTo: endDate)
          .where('category',isEqualTo: category)
          .get();
      log('response - ${transactionData.docs}');
    }catch (e){
      print(e);
    }
  }

}