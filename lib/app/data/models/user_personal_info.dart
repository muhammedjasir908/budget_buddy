import 'package:equatable/equatable.dart';

class UserPersonalInfo extends Equatable{
  String email;
  String name;
  String profileImageUrl;
  dynamic userId;

  UserPersonalInfo({
   this.email = '',
   this.name = '',
   this.profileImageUrl = '',
   this.userId = '',
});

  static UserPersonalInfo fromDocSnap(Map<String, dynamic>? snap) {
    return UserPersonalInfo(
      email: snap?["email"] ?? "",
      name: snap?["name"] ?? '',
      profileImageUrl: snap?['profileImageUrl'] ?? '',
      userId: snap?['uid'] ?? ''
    );
  }

  Map<String, dynamic> toMap() => {
    'email':email,
    'name':name,
    'profileImageUrl':profileImageUrl,
    'uid':userId
  };

  @override
  List<Object?> get props => [
    email,name,profileImageUrl,userId
  ];
}