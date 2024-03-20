import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:budget_buddy/app/data/datasources/firestore_user_info.dart';
import 'package:budget_buddy/app/data/models/user_personal_info.dart';
import 'package:budget_buddy/app/domain/repositories/user_repository.dart';
import 'package:image_picker/image_picker.dart';

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
  Future<void> addUserImage({required Uint8List photo,required String userId,required String previousImageUrl}) async {
    try{
      String imageUrl = await Fir
    }catch(e){
      return Future.error(e.toString());
    }
  }

  @override
  Future<void> deleteUSer(String uid) {
    // TODO: implement deleteUSer
    throw UnimplementedError();
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