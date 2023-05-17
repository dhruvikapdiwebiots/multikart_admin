import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../config.dart';

class VariantController extends GetxController {
  String idType = "", productIdType = "";
  bool isLoading = true;
  var random = Random();
  String id = "";

  //add banner
  saveBanner(title, titleId) async {
    isLoading = true;
    update();
    // String id = DateTime.now().millisecondsSinceEpoch.toString();
    isLoading = false;
    update();
    await FirebaseFirestore.instance.collection("config").doc(id).update({
      title: titleId,
    }).then((value) {
      // appCtrl.isAlert = false;
      isLoading = false;
      update();
    });
  }

  getData() {
    // idType = [];
    FirebaseFirestore.instance
        .collection(collectionName.config)
        .get()
        .then((value) {
      value.docs.asMap().entries.forEach((element) {
        if (value.docs.isNotEmpty) {
          id = value.docs[0].id;

          // usageCtrl = value.docs[0].data();
          // txtPrivacyPolicyLink.text = usageCtrl["privacyPolicyLink"];
          // txtRateAppAndroidId.text = usageCtrl["rateAppAndroidId"];
          // txtRateAppIOSId.text = usageCtrl["rateAppIOSId"];
          // txtRefundLink.text = usageCtrl["refundLink"];
          // imageUrl = usageCtrl["splashLogo"] ?? "";
        }
        // banner.add(element.value.data());
      });
    });
    // update();
    // return banner;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    update();
    getData();
    super.onInit();
  }
}
