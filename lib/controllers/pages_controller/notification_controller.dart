import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
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
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtContent = TextEditingController();
  TextEditingController txtProductCollectionId = TextEditingController();


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

  //send notification
  Future<void> sendNotification(
      {data}) async {
    final data = {
      "notification": {"body": txtContent.text, "title": txtTitle.text, },
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "alertMessage": 'true',
        "title": txtTitle.text,
      },
      "to": "dfWhS-FDSfOcvRGktKu5LJ:APA91bGpgJ0VgdjgBvBL0kD3TkCcLRqJ-Z-U14aT9hUUZy-ShSpjdSoyaWeJ9OvO7MKeS9xkFj6BhpjtYagswEG1OLw4uhd45gxZ7ypCoSWTqHRs_V_JumM07h43pQUjlFHFX7RtRj-H"
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization':
      'key=AAAAphwmbKY:APA91bGHsxPDGQmFD1XKbx3BKGmjFZTjBy3VXHIKVZ4HJVr0wYuG7c-7FOQGI6rrdR8ahTKkyv8yAso-PZXDZ00unk0rnJXq_Y1V-R1GH7omkP6hEzaydYlZAbIx48VofT831bpe_nLR'
    };

    BaseOptions options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: headers,
    );

    try {
      final response = await Dio(options)
          .post('https://fcm.googleapis.com/fcm/send', data: data);

      if (response.statusCode == 200) {
        log('Alert push notification send');
      } else {
        log('notification sending failed');
        // on failure do sth
      }
    } catch (e) {
      log('exception $e');
    }

  }
}
