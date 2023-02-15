import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:multikart_admin/config.dart';

class NotificationController extends GetxController {

  String idType = "";
  String imageName = "";
  late DropzoneViewController? controller1;
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtContent = TextEditingController();
  TextEditingController txtProductCollectionId = TextEditingController();

  //send notification
  Future<void> sendNotification(
      {data}) async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest);
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    }else {
      final data = {
        "notification": {"body": txtContent.text, "title": txtTitle.text,},
        "priority": "high",
        "data": {
          "click_action": "FLUTTER_NOTIFICATION_CLICK",
          "alertMessage": 'true',
          "title": txtTitle.text,
        },
        "to": "eS1UT5AyT8SGh0GWh1x69R:APA91bE344mt0TzcWxHIYypx2I4-zbeOD-ntaTEhaRpmfU-jjz5cfiUAg5XCM1iXuxsXLMy2R59FfzanwQexkMF0_rBxAkQcsE_0iBRj51IzSkIGMechyGJaXRi3lD5FRBpJg-WyqvGf"
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
          txtTitle.text = "";
          txtContent.text = "";
          txtProductCollectionId.text = "";
          idType = "";
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
}
