import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../config.dart';

class StaticController extends GetxController {
  TextEditingController txtAboutUs = TextEditingController();
  String id = "";
  TextEditingController txtContactUs = TextEditingController();
  TextEditingController txtTermsCondition = TextEditingController();
  TextEditingController txtPrivacyPolicy = TextEditingController();
  bool isLoading = false;

  @override
  void onReady() {
    // TODO: implement onReady
    getData();
    super.onReady();
  }

  //get data from firebase
  getData() async {

    await FirebaseFirestore.instance
        .collection(collectionName.static)
        .get()
        .then((value) {
      id = value.docs[0].id;
      txtAboutUs.text = value.docs[0].data()["aboutUs"];
      txtContactUs.text = value.docs[0].data()["contactUs"];
      txtTermsCondition.text = value.docs[0].data()["termsCondition"];
      txtPrivacyPolicy.text = value.docs[0].data()["privacyPolicy"];
      update();
    });
    update();
  }

  //update data
  updateData() async {
    isLoading = true;
    update();
    await FirebaseFirestore.instance
        .collection(collectionName.static)
        .doc(id)
        .update({
      "aboutUs": txtAboutUs.text,
      "contactUs": txtContactUs.text,
      "termsCondition": txtTermsCondition.text,
      "privacyPolicy": txtPrivacyPolicy.text
    }).then((value) {
      isLoading = false;
      update();
    });
    update();
    getData();
    log("id : $id");
  }
}
