import 'package:budget_buddy/app/data/models/user_personal_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../core/resources/strings_manager.dart';

class FirestoreUserInfo {
  static final _firebaseAuth = FirebaseAuth.instance;
  static final _fireStoreUser = FirebaseFirestore.instance;

  static Future<void> createUser(UserPersonalInfo newUserInfo) async {
    await _fireStoreUser.collection('users')
        .doc(newUserInfo.userId)
        .set(newUserInfo.toMap());
  }

  static Future<UserPersonalInfo> getUserInfo(dynamic userId) async {
    DocumentSnapshot<Map<String,dynamic>?> snap = await _fireStoreUser.collection('users').doc(userId).get();
    if(snap.exists){
      return UserPersonalInfo.fromDocSnap(snap.data());
    }else{
      return Future.error(StringsManager.userNotExist.tr);
    }
  }

  static updateProfileImage({required String imageUrl,required String userId}) async {
    await _fireStoreUser.collection('users').doc(userId).update({
      "profileImageUrl":imageUrl
    });
  }

  static updateUserInfo(UserPersonalInfo userInfo) async {
    await _fireStoreUser.collection('users')
        .doc(userInfo.userId)
        .update(userInfo.toMap());
  }

  static deleteUserInfo(String userId) async {
    await _firebaseAuth.currentUser?.delete();
    await _fireStoreUser.collection('users').doc(userId).delete();
    await _fireStoreUser.collection('transactions').doc(userId).delete();
  }
}