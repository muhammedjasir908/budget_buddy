import 'package:budget_buddy/app/data/repositories_impl/user_repository_impl.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddUserDetailsController extends GetxController{

  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController incomeController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  RxString selectedUserStatus = 'Working'.obs;

  List<String> userStatusList = [
    'Working',
    'Business',
    'Student',
    'Investor',
    'HouseWife',
    'Marketing'
  ];

  final formKey = GlobalKey<FormState>();

  onCameraTap() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _image = image;
    update();
  }

  onSaveTap() async {
    final form = formKey.currentState!;
    String imageUrl = '';
    if(form.validate()){
      if(_image != null) {
        imageUrl = await UserRepositoryImpl().addUSerImage('', _image!);
      }
      Map<String, dynamic> userData = {
        'username':usernameController.text,
        "email":"",
        "income":double.tryParse(incomeController.text),
        "job_status":selectedUserStatus.value,
        "photo_url":imageUrl,
        "uid":""
      };
      await UserRepositoryImpl().addUserDetails('', userData);
    }
  }
}