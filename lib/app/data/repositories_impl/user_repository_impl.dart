import 'dart:typed_data';

import 'package:budget_buddy/app/data/datasources/firebase_storage.dart';
import 'package:budget_buddy/app/data/datasources/firestore_user_info.dart';
import 'package:budget_buddy/app/data/models/user_personal_info.dart';
import 'package:budget_buddy/app/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository{

  @override
  Future<void> addUserDetails(UserPersonalInfo userPersonalInfo) async {
    try{
      await FirestoreUserInfo.createUser(userPersonalInfo);
    }catch(e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<String> uploadProfileImage({required Uint8List photo,required String userId,required String previousImageUrl}) async {
    try{
      String imageUrl = await FirebaseStorageImage.uploadData(
          folderName: 'userImage',
          data: photo
      );
      await FirestoreUserInfo.updateProfileImage(imageUrl: imageUrl, userId: userId);
      await FirebaseStorageImage.deleteImageFromStorage(previousImageUrl);
      return imageUrl;
    }catch(e){
      return Future.error(e.toString());
    }
  }

  @override
  Future<void> deleteUSer(String uid) async {
    try{
      await FirestoreUserInfo.deleteUserInfo(uid);
    }catch(e){
      return Future.error(e.toString());
    }
  }

  @override
  Future<UserPersonalInfo> getUserDetails(String userId) async {
    try{
      UserPersonalInfo userPersonalInfo = await FirestoreUserInfo.getUserInfo(userId);
      return userPersonalInfo;
    }catch(e){
      return Future.error(e.toString());
    }
  }

}