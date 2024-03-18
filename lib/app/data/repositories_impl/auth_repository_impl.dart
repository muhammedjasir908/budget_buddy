import 'package:budget_buddy/app/data/exceptions/app_exception.dart';
import 'package:budget_buddy/app/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl extends AuthRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<User?> signUpWithEmail(String email,String password,String confirmPassword) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e){
      if (kDebugMode) {
        print("Error signing in : ${e.message}");
      }
      throw AppException(e.code, e.message);
    }catch(e){
      throw AppException('unknown error', 'An unknown error occurred');
    }
  }

  @override
  Future<User?> singInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e){
      if (kDebugMode) {
        print("Error signing in : ${e.message}");
      }
      throw AppException(e.code, e.message);
    }catch(e){
      throw AppException('unknown error', 'An unknown error occurred');
    }
  }

  @override
  Future<void> facebookLogin(String token) {
    // TODO: implement facebookLogin
    throw UnimplementedError();
  }

  @override
  Future<UserCredential?> googleLogin() async {
    try{
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if(googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
        );
        return await _auth.signInWithCredential(credential);
      }
    }catch(e){
      if (kDebugMode) {
        print("Error signing in with google: $e");
      }
    }
    return null;
  }

  @override
  Future<bool> isAuthenticated() {
    // TODO: implement isAuthenticated
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return;
    } on FirebaseAuthException catch(e){
      throw AppException(e.code, e.message);
    }catch(e){
      throw AppException('reset_password_error', 'Error resetting password');
    }
  }

  @override
  Future<void> changePassword(String password, String code) async {
    try {
      await _auth.confirmPasswordReset(code: code, newPassword: password);
    } on FirebaseAuthException catch (e){
      throw AppException(e.code, e.message);
    }catch(e){
      throw AppException('reset_password_error', 'Error resetting password');
    }
  }



  @override
  Future<void> verifyEmail() {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }

}