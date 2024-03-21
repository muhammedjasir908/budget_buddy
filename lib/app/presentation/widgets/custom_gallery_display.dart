import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_plus/image_picker_plus.dart';

import '../../core/functions/compress_image.dart';

class CustomImagePickerPlus{

  static Future<void> pickFromBoth(BuildContext context) async {
    ImagePickerPlus picker = ImagePickerPlus(context);
    await picker.pickImage(source: ImageSource.both,
    multiImages: true,
    galleryDisplaySettings: GalleryDisplaySettings(
      showImagePreview: true,
      cropImage: true,
      tabsTexts: tabsNames(),
      appTheme: appTheme(context),
      callbackFunction: (details) async {
        await moveToCreationPage(context,details);
      }
    ));
  }

 static AppTheme appTheme(BuildContext context){
    return AppTheme(
      focusColor: Theme.of(context).focusColor,
      primaryColor: Theme.of(context).primaryColor,
      shimmerBaseColor: Theme.of(context).textTheme.headlineSmall!.color!,
      shimmerHighlightColor: Theme.of(context).textTheme.titleLarge!.color!
    );
 }

 static TabsTexts tabsNames() {
    return TabsTexts(
      deletingText: 'Delete',
      galleryText: 'Gallery',
      holdButtonText: 'Press and Hold',
      limitingText: 'Limit of Photos',
      clearImagesText: 'Clear selected images',
      notFoundingCameraText: 'No secondary Camera found',
      photoText: 'Photo'
    );
 }

 static Future<void> moveToCreationPage(BuildContext context,SelectedImagesDetails details) async {
    for(final selectedFile in details.selectedFiles){
      if(!selectedFile.isThatImage) continue;
      File file = selectedFile.selectedFile;
      File? compressByte = await CompressImage.compressFile(file);
      File convertedFile = compressByte ?? file;
      selectedFile.selectedFile = convertedFile;
    }
 }
}