import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserTransactionInfo extends Equatable {
  String title;
  String description;
  String category;
  String imageUrl;
  double amount;
  String type;
  String transactionDate;
  String transactionId;
  String userId;

  UserTransactionInfo(
      {this.title = '',
      this.description = '',
      this.category = '',
      this.imageUrl = '',
      this.amount = 0.0,
      this.type = '',
      this.transactionDate = '',
      this.transactionId = '',
      this.userId = ''});

  static UserTransactionInfo fromQuery({
    DocumentSnapshot<Map<String,dynamic>>? doc,
    QueryDocumentSnapshot<Map<String, dynamic>>? query}) {
    dynamic snap = doc ?? query;
    return UserTransactionInfo(
        title: snap.data()?['title'] ?? '',
        description: snap.data()?['description'] ?? '',
        category: snap.data()?['category'] ?? '',
        imageUrl: snap.data()?['imageUrl'] ?? '',
        amount: snap.data()?['amount'] ?? 0.0,
        type: snap.data()?['type'] ?? '',
        transactionDate: snap.data()?['transactionDate'] ?? '',
        transactionId: snap.data()?['transactionId'] ?? '',
        userId: snap.data()?['userId'] ?? '');
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'description': description,
        'category': category,
        'imageUrl': imageUrl,
        'amount': amount,
        'type': type,
        'transactionDate': transactionDate,
        'transactionId': transactionId,
        'userId':userId,
      };

  @override
  List<Object?> get props => [
        title,
        description,
        category,
        imageUrl,
        amount,
        type,
        transactionDate,
        transactionId,
        userId
      ];
}
