abstract class UserRepository{

  Future<void> addUserDetails(Map<String,dynamic> userData);

  Future<void> getUserDetails();

  Future<void> deleteUSer();

}