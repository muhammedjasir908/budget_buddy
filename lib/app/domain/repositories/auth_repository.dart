import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository{

  Future<void> signUpWithEmail(String email,String password,String confirmPassword);

  Future<void> singInWithEmail(String email,String password);

  Future<UserCredential?> googleLogin();

  Future<void> facebookLogin(String token);

  Future<void> resetPassword(String email);

  Future<void> changePassword(String password,String code);

  Future<void> verifyEmail();

  Future<void> logout();

  Future<bool> isAuthenticated();
}