import 'dart:developer';
import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multikart_admin/config.dart';
import 'package:multikart_admin/pages/index/index.dart';
import '../../common/theme/index.dart';

class LoginController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool obscureText = true;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
  /*  bool isLogin = appCtrl.storage.read(session.isLogin) ?? false;
    log("iss : ,$isLogin");
    if(isLogin){

      Get.offAllNamed(routeName.index);
    }*/

    bool isTheme = appCtrl.storage.read(session.isDarkMode) ?? false;
    log("isTheme : $isTheme");

    update();
    appCtrl.isTheme = isTheme;
    ThemeService().switchTheme(appCtrl.isTheme);
    appCtrl.update();

    log("iss : ,${appCtrl.isLogin}");

    appCtrl.languageVal = appCtrl.storage.read(session.languageCode) ?? "en";
    log("language : ${appCtrl.languageVal}");
    if (appCtrl.languageVal == "en") {
      var locale = const Locale("en", 'US');
      Get.updateLocale(locale);
    } else if (appCtrl.languageVal == "ar") {
      var locale = const Locale("ar", 'AE');
      Get.updateLocale(locale);
    } else if (appCtrl.languageVal == "hi") {
      var locale = const Locale("hi", 'IN');
      Get.updateLocale(locale);
      Get.forceAppUpdate();
    } else {
      var locale = const Locale("ko", 'KR');
      Get.updateLocale(locale);
    }
    update();

    super.onInit();
  }

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
              await appCtrl.storage.write(session.isLoginTest, true);
              Get.offAllNamed(routeName.index);

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

    super.onReady();
  }
}
