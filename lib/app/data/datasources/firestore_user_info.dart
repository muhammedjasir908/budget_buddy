import 'package:budget_buddy/app/data/models/user_personal_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserInfo {

  static final _fireStoreUserCollection = FirebaseFirestore.instance.collection('users');

  static Future<void> createUser(UserPersonalInfo newUserInfo) async {
    await _fireStoreUserCollection
        .doc(newUserInfo.userId)
        .set(newUserInfo.toMap());
  }

  static Future<UserPersonalInfo> getUserInfo(dynamic userId) async {
    DocumentSnapshot<Map<String,dynamic>?> snap = await _fireStoreUserCollection.doc(userId).get();
    if(snap.exists){
      return UserPersonalInfo.fromDocSnap(snap.data());
    }else{
      return Future.error(StringsManager.userNotExist.tr);
    }
  }

  static updateProfileImage({required String imageUrl,required String userId}) async {
    await _fireStoreUserCollection.doc(userId).update({
      "profileImageUrl":imageUrl
    });
  }

  static updateUserInfo(UserPersonalInfo userInfo) async {
    await _fireStoreUserCollection
        .doc(userInfo.userId)
        .update(userInfo.toMap());
  }


}