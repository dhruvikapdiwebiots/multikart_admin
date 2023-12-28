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
        value.docs
            .asMap()
            .entries
            .forEach((e) async {
          log("DATA : ${e.value.data()}");
          if (e.value.data()["userName"] == txtName.text) {
            if (e.value.data()["password"] == txtPassword.text) {
              html.window.localStorage[session.isLogin] == "true";
              await appCtrl.storage.write(session.isLogin, true);
              if (txtName.text == "admin@gmail.com" &&
                  txtPassword.text == "Admin1234") {
                await appCtrl.storage.write(session.isLoginTest, true);
              } else {
                await appCtrl.storage.write(session.isLoginTest, false);
              }
              html.window.localStorage[session.isLogin] = "true";
              await appCtrl.storage.write(session.isLogin, true);
              await appCtrl.storage.write(session.isLoginTest, true);
              txtName.text = "";
              txtPassword.text = "";
              update();
              Get.offAll(() => IndexLayout(scaffoldDrawerKey: scaffoldDrawerKey,scaffoldKey: scaffoldKey,));
            } else {

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Password")));
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Email or Password")));

          }
        });
        /*if (value.docs[0].data().isNotEmpty) {
          if (value.docs[0].data()["userName"] == txtName.text) {
            if (value.docs[0].data()["password"] == txtPassword.text) {
              html.window.localStorage[session.isLogin] = "true";
              await appCtrl.storage.write(session.isLogin, true);
              await appCtrl.storage.write(session.isLoginTest, true);
              txtName.text = "";
              txtPassword.text = "";
              update();
              Get.offAll(() => IndexLayout(scaffoldDrawerKey: scaffoldDrawerKey,scaffoldKey: scaffoldKey,));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Password')));
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Email or Password')));

          }
        } else {
          log("Invalid Credential");
        }*/

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
