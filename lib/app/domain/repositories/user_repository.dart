import 'package:budget_buddy/app/data/models/user_personal_info.dart';
import 'package:image_picker/image_picker.dart';

abstract class UserRepository{

  Future<void> addUserDetails(UserPersonalInfo userPersonalInfo);

  Future<void> addUserImage(String uid,XFile image);

  Future<void> getUserDetails(String userId);

  Future<void> deleteUSer(String uid);

}