import 'dart:async';
import 'dart:html';
import 'dart:io' as io;
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:developer' as log;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../config.dart';

class StaticController extends GetxController {

  TextEditingController txtAboutUs = TextEditingController();
  TextEditingController txtContactUs = TextEditingController();
  TextEditingController txtTermsCondition = TextEditingController();
  TextEditingController txtPrivacyPolicy = TextEditingController();


  @override
  void onReady() {
    // TODO: implement onReady
    getData();
    super.onReady();
  }

  getData()async{
    await FirebaseFirestore.instance.collection(collectionName.static).get().then((value) {
      log.log("dd : ${value.docs[0].data()["aboutUs"]}");
      txtAboutUs.text = value.docs[0].data()["aboutUs"];
      txtContactUs.text = value.docs[0].data()["contactUs"];
      txtTermsCondition.text = value.docs[0].data()["privacyPolicy"];
      txtPrivacyPolicy.text = value.docs[0].data()["aboutUs"];
      update();
    });
  }
}
