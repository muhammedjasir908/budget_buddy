import 'package:budget_buddy/app/data/datasources/firebase_auth.dart';
import 'package:budget_buddy/app/domain/entities/registered_user.dart';
import 'package:budget_buddy/app/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl extends AuthRepository{
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  @override
  Future<void> facebookLogin(String token) {
    // TODO: implement facebookLogin
    throw UnimplementedError();
  }

  @override
  Future<void> googleLogin() async {
    try{
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      // if(googleSignInAccount != null){
      //   final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      //   final AuthCredential credential = GoogleAuthProvider.credential(
      //     accessToken: googleSignInAuthentication.accessToken,
      //     idToken: googleSignInAuthentication.idToken
      //   );
      //   return await _auth.signInWithCredential(credential);
      // }
    }catch(e){
      if (kDebugMode) {
        print("Error signing in with google: $e");
      }
    }
    return null;
  }

  @override
  Future<void> changePassword(RegisteredUser userInfo) async {
    try{
      await FirebaseAuthentication.changePassword(email: userInfo.email, password: userInfo.password);
    }catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<void> resetPassword(RegisteredUser userInfo) async {
    try{
      await FirebaseAuthentication.resetPassword(email: userInfo.email, password: userInfo.password);
    }catch (e){
      return Future.error(e.toString());
    }
  }

  @override
  Future<void> logout({required String userId}) async {
    try{
      await FirebaseAuthentication.signOut();
    } catch (e){
      return Future.error(e.toString());
    }
  }

  @override
  Future<User> signUpWithEmail(RegisteredUser newUserInfo) async {
   try{
     User userId = await FirebaseAuthentication.signUp(
         email: newUserInfo.email, password: newUserInfo.password);
     return userId;
   } catch (e){
     return Future.error(e.toString());
   }
  }

  @override
  Future<User> singInWithEmail(RegisteredUser userInfo) async {
    try{
      return await FirebaseAuthentication.login(
          email: userInfo.email, password: userInfo.password);
    } catch (e){
      return Future.error(e.toString());
    }
  }

}