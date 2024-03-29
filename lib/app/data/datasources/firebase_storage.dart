import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

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

  static Future<String> uploadData({
    required String folderName,required Uint8List data}) async {
    final fileName = DateTime.now().toString();
    final destination = 'data/$folderName/$fileName';
    final ref = FirebaseStorage.instance.ref(destination);
    UploadTask uploadTask = ref.putData(data);
    String fileOfImageUrl = await(await uploadTask.whenComplete(() => {})).ref.getDownloadURL();
    return fileOfImageUrl;
  }

  static Future<void> deleteImageFromStorage(String previousImageUrl) async {
    String previousFileUrl = Uri.decodeFull(basename(previousImageUrl)).replaceAll(RegExp(r'(\?alt).*'), '');
    final Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(previousFileUrl);
    await firebaseStorageRef.delete().then((value) => {});
  }
}