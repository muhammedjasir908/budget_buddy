import 'dart:typed_data';

import 'package:budget_buddy/app/data/models/user_personal_info.dart';
import 'package:image_picker/image_picker.dart';

abstract class UserRepository{

  Future<void> addUserDetails(UserPersonalInfo userPersonalInfo);

  Future<String> uploadProfileImage({required Uint8List photo,required String userId,required String previousImageUrl});

  Future<void> getUserDetails(String userId);

  Future<void> deleteUSer(String uid);

}