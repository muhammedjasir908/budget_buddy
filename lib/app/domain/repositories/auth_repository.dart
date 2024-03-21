import 'package:firebase_auth/firebase_auth.dart';

import '../entities/registered_user.dart';

abstract class AuthRepository{

  Future<User> signUpWithEmail(RegisteredUser newUserInfo);

  Future<User> singInWithEmail(RegisteredUser userInfo);

  Future<void> googleLogin();

  Future<void> resetPassword(RegisteredUser userInfo);

  Future<void> changePassword(RegisteredUser userInfo);

  Future<void> logout({required String userId});
}