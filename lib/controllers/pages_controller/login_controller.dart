import 'dart:developer';
import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multikart_admin/config.dart';
import 'package:multikart_admin/pages/index/index.dart';

class LoginController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool obscureText = true;
  final formKey = GlobalKey<FormState>(debugLabel: "Key1");
  var scaffoldDrawerKey = GlobalKey<ScaffoldState>(debugLabel: "drawer");
  var scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: "key2");

  //login
  signIn(context) async {
    if (formKey.currentState!.validate()) {
      await FirebaseFirestore.instance
          .collection(collectionName.admin)
          .get()
          .then((value) async {
        log("value : #$value");
        if (value.docs[0].data().isNotEmpty) {
          if (value.docs[0].data()["userName"] == txtName.text) {
            if (value.docs[0].data()["password"] == txtPassword.text) {
              html.window.localStorage[session.isLogin] = "true";
              await appCtrl.storage.write(session.isLogin, true);
              await appCtrl.storage.write(session.isLoginTest, false);
              txtName.text = "";
              txtPassword.text = "";
              update();
              Get.offAll(() => IndexLayout(scaffoldDrawerKey: scaffoldDrawerKey,scaffoldKey: scaffoldKey,));
            } else {
              showAlert(context: context, title: "Invalid Password");
            }
          } else {
            showAlert(context: context, title: 'Invalid Email or Password');
          }
        } else {
          log("Invalid Credential");
        }
      });
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getAdminCredential();
    appCtrl.getStorageData();
    super.onReady();
  }

  getAdminCredential()async{
    await FirebaseFirestore.instance.collection("admin").get().then((value) {
      txtName.text = value.docs[0].data()["userName"];
      txtPassword.text = value.docs[0].data()["password"];
      update();
    });
  }
}
