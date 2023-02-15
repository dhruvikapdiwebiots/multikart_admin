
import '../../config.dart';

class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  final storage = GetStorage();

  AppTheme get appTheme => _appTheme;
  int selectedIndex = 0;
  bool isTheme = false;
  bool isAlert = false;
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

}

