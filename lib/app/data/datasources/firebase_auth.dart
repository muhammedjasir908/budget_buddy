import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  get user => _firebaseAuth.currentUser;

  static Future<User> signUp(
      {required String email, required String password}) async {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = result.user!;
    return user;
  }

  static Future<User> login(
      {required String email, required String password}) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    final user = result.user!;
    return user;
  }

  static Future resetPassword(
          {required String email, required String password}) async =>
      await _firebaseAuth.sendPasswordResetEmail(email: email);

  static Future changePassword(
          {required String email, required String password}) async =>
      await _firebaseAuth.currentUser?.updatePassword(password);

  static Future signOut() async => await _firebaseAuth.signOut();

}
