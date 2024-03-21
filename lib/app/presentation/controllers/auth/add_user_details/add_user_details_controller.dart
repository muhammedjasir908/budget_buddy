import 'dart:typed_data';

import 'package:budget_buddy/app/data/models/user_personal_info.dart';
import 'package:budget_buddy/app/data/repositories_impl/user_repository_impl.dart';
import 'package:budget_buddy/app/presentation/widgets/custom_gallery_display.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker_plus/image_picker_plus.dart';

class AddUserDetailsController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController incomeController = TextEditingController();

  RxString selectedUserStatus = 'Working'.obs;

  RxString userId = ''.obs;
  RxString profileImageUrl = ''.obs;
  RxString userEmail = ''.obs;

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
    SelectedImagesDetails? details = await editUserImage();
    if (details == null) return;
    Uint8List pickImage =
        await (details.selectedFiles[0].selectedFile).readAsBytes();
    profileImageUrl.value = await UserRepositoryImpl().uploadProfileImage(
        photo: pickImage, userId: userId.value, previousImageUrl: '');
  }

  Future<SelectedImagesDetails?> editUserImage() async {
    ImagePickerPlus picker = ImagePickerPlus(Get.context!);
    SelectedImagesDetails? details = await picker.pickImage(
      source: ImageSource.both,
      galleryDisplaySettings: GalleryDisplaySettings(
          showImagePreview: true,
          cropImage: true,
          tabsTexts: CustomImagePickerPlus.tabsNames(),
          appTheme: CustomImagePickerPlus.appTheme(Get.context!)),
    );
    return details;
  }

  onSaveTap() async {
    final form = formKey.currentState!;
    if (form.validate()) {
      UserPersonalInfo userPersonalInfo = UserPersonalInfo(
        email: userEmail.value,
        name: usernameController.text,
        totalExpense: 0.0,
        balance: double.parse(incomeController.text.trim()),
        income: double.parse(incomeController.text.trim()),
        profileImageUrl: profileImageUrl.value,
        userId: userId.value,
        userStatus: selectedUserStatus.value
      );
      await UserRepositoryImpl().addUserDetails(userPersonalInfo);
    }
  }
}
