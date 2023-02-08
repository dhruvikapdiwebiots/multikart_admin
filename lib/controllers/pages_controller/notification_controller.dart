import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/config.dart';

class NotificationController extends GetxController {
  File? pickImage;
  XFile? imageFile;
  bool isUploadSize = false,isAlert= false;
  Uint8List uploadWebImage = Uint8List(8);
  Uint8List webImage = Uint8List(8);
  String idType = "";
  String imageName = "";
  late DropzoneViewController? controller1;

// GET IMAGE FROM GALLERY
  Future getImage({source, dropImage}) async {
    if (kDebugMode) {
      if (dropImage != null) {
        if (imageName.contains("png") ||
            imageName.contains("jpg") ||
            imageName.contains("jpeg")) {
          var image = dropImage;
          uploadWebImage = image;
          log("info 1: $image");

          Image image1 = Image.memory(uploadWebImage);

          ImageInfo info = await getImageInfo(image1);
          log("info : ${info.image.width}");
          log("info : ${info.image.width}");
          if (info.image.width > 300 && info.image.height > 50) {
            webImage = uploadWebImage;
            pickImage = File("a");
            isUploadSize = false;
          } else {
            isUploadSize = true;
          }
          appCtrl.isAlert = false;
          appCtrl.update();
        } else {
          appCtrl.isAlert = true;
          appCtrl.update();
          await Future.delayed(Durations.s2);
          appCtrl.isAlert = false;
          appCtrl.update();
        }
        update();
      } else {
        final ImagePicker picker = ImagePicker();
        imageFile = (await picker.pickImage(source: source))!;
        if (imageFile!.name.contains("png") ||
            imageFile!.name.contains("jpg") ||
            imageFile!.name.contains("jpeg")) {
          var image = await imageFile!.readAsBytes();
          uploadWebImage = image;
          log("info 1: $image");
          Image image1 = Image.memory(uploadWebImage);
          ImageInfo info = await getImageInfo(image1);
          if (info.image.width > 300 && info.image.height > 50) {
            webImage = uploadWebImage;
            pickImage = File(imageFile!.path);
            isUploadSize = false;
          } else {
            isUploadSize = true;
          }
          appCtrl.isAlert = false;
          appCtrl.update();
        } else {
          appCtrl.isAlert = true;
          appCtrl.update();
          await Future.delayed(Durations.s2);
          appCtrl.isAlert = false;
          appCtrl.update();
        }
      }
    }
  }
}
