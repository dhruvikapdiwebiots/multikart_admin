

import '../../common/theme/index.dart';
import '../../config.dart';

class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  final storage = GetStorage();

  AppTheme get appTheme => _appTheme;
  int selectedIndex = 0;
  bool isTheme = false;
  bool isAlert = false;
  bool isStaticPage = false;
  bool isRTL = false;
  String isLogin = "false";
  String languageVal = "in";
  List drawerList = [];
  int currVal = 1;
  String deviceName = "";
  String device = "";
  dynamic userAppSettingsVal;
  dynamic usageControlsVal;
  var deviceData = <String, dynamic>{};

//list of bottommost page
  List<Widget> widgetOptions = <Widget>[];

  //update theme
  updateTheme(theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }

  //get storage data
  getStorageData(){

    bool isTheme = appCtrl.storage.read(session.isDarkMode) ?? false;
    update();
    appCtrl.isTheme = isTheme;
    ThemeService().switchTheme(appCtrl.isTheme);
    appCtrl.update();


    appCtrl.languageVal = appCtrl.storage.read(session.languageCode) ?? "en";

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
      Get.forceAppUpdate();
    }
    update();

  }
}

