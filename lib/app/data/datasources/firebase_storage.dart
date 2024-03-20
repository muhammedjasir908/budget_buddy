import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageImage{

  static Future<String> uploadFile({
   required String folderName,
   required File imageFile
}) async {
    final fileName = basename(imageFile.path);
    final destination = 'files/$folderName/$fileName';
    final ref = FirebaseStorage.instance.ref(destination);
    UploadTask uploadTask = ref.putFile(imageFile);
    String fileOfImageUrl = await (await uploadTask.whenComplete(() {})).ref.getDownloadURL();
    return fileOfImageUrl;
  }

  static Future<void> deleteImageFromStorage(String previousImageUrl) async {
    // String previousFileUrl =
  }
}