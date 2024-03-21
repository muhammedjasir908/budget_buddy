import 'package:equatable/equatable.dart';

class UserPersonalInfo extends Equatable {
  final String email;
  final String name;
  final double totalExpense;
  final double balance;
  final double income;
  final String profileImageUrl;
  final String userId;
  final String userStatus;

  const UserPersonalInfo({
    this.email = '',
    this.name = '',
    this.totalExpense = 0.0,
    this.balance = 0.0,
    this.income = 0.0,
    this.profileImageUrl = '',
    this.userId = '',
    this.userStatus = '',
  });

  static UserPersonalInfo fromDocSnap(Map<String, dynamic>? snap) {
    return UserPersonalInfo(
        email: snap?["email"] ?? "",
        name: snap?["name"] ?? '',
        totalExpense: snap?['total_expense'] ?? '',
        balance: snap?['balance'] ?? '',
        income: snap?['income'] ?? '',
        profileImageUrl: snap?['profile_image_url'] ?? '',
        userId: snap?['user_id'] ?? '',
        userStatus: snap?['user_status'] ?? '');
  }

  Map<String, dynamic> toMap() => {
        'email': email,
        'name': name,
        'total_expense': totalExpense,
        'balance': balance,
        'income': income,
        'profile_image_url': profileImageUrl,
        'user_id': userId,
        'user_status': userStatus
      };

  @override
  List<Object?> get props => [
        email,
        name,
        totalExpense,
        balance,
        income,
        profileImageUrl,
        userId,
        userStatus
      ];
}
