import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:multikart_admin/pages/about_app_page/AboutApp.dart';
import 'package:multikart_admin/pages/index/side_bar_menu_model.dart';
import 'package:multikart_admin/pages/onboard_screen/onboard_screen.dart';
import 'package:multikart_admin/pages/variant/variant.dart';

import 'dart:html' as html;
import '../../config.dart';

class IndexLayoutController extends GetxController {
  ValueNotifier<bool> isOpen = ValueNotifier(true);
  GlobalKey<ScaffoldState>? scaffoldDrawerKey;
  GlobalKey<ScaffoldState>? scaffoldKey;
  int selectedIndex = 0;
  int? subSelectIndex;
  int staticPageIndex = 0;
  String pageName = fonts.addBanner.tr;
  bool isHover = false;
  bool isSubHover = false;
  int isSelectedHover = 1;
  int isSubSelectedHover = 1;

  final sidebarMenuConfigs = [
    SidebarMenuConfig(
      uri: routeName.banner,
      icon: svgAssets.banner,
      title: fonts.addBanner,
    ),
    SidebarMenuConfig(
      uri: routeName.variant,
      icon: svgAssets.variant,
      title: fonts.setVarient,
    ),
    SidebarMenuConfig(
      uri: '',
      icon: svgAssets.page,
      title: fonts.staticPage,
      children: [
        SidebarChildMenuConfig(

          uri: routeName.aboutsUs,
          icon: svgAssets.page,
          title: fonts.aboutUs,
        ),
        SidebarChildMenuConfig(
          uri: routeName.contactUs,
          icon: svgAssets.page,
          title: fonts.contactUs,
        ),
        SidebarChildMenuConfig(
          uri: routeName.termsCondition,
          icon: svgAssets.page,
          title: fonts.termsCondition,
        ),
        SidebarChildMenuConfig(
          uri: routeName.privacyPolicy,
          icon: svgAssets.page,
          title: fonts.privacyPolicy,
        ),
      ],
    ),
    SidebarMenuConfig(
      uri: routeName.aboutApp,
      icon: svgAssets.aboutApp,
      title: fonts.aboutApp,
    ),
    SidebarMenuConfig(
      uri: routeName.notification,
      icon: svgAssets.onBoard,
      title: fonts.onBoardScreen,
    ),
    SidebarMenuConfig(
      uri: routeName.notification,
      icon: svgAssets.bell,
      title: fonts.notification,
    ),
    SidebarMenuConfig(
      uri: '',
      icon: svgAssets.logout,
      title: fonts.logout,
    ),
  ];

  final ScrollController scrollController = ScrollController();

  //list of bottommost page
  List<Widget> widgetOptions = <Widget>[
    BannerPage(),
    VariantScreen(),
    Container(),
    AboutApp(),
    OnboardScreen(),
    NotificationPage(),
    Container()
  ];

  @override
  void onReady() {
    // TODO: implement onReady
    appCtrl.getStorageData();
    super.onReady();
  }

  setKey(
      {GlobalKey<ScaffoldState>? scaffoldDrawerKey1,
      GlobalKey<ScaffoldState>? scaffoldKey1}) {
    scaffoldDrawerKey = scaffoldDrawerKey1;
    scaffoldKey = scaffoldKey1;
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  drawerTap(index, context, {SidebarMenuConfig? value}) async {
    subSelectIndex = null;
    selectedIndex = index;

    pageName = value!.title.toString();
    if (!Responsive.isDesktop(context)) {
      log("MOBILE");
      Get.back();
    }
    if (selectedIndex == 1) {
      final staticCtrl = Get.isRegistered<StaticController>()
          ? Get.find<StaticController>()
          : Get.put(StaticController());
      staticCtrl.getData();
    }
    if (selectedIndex == 6) {
      FirebaseAuth.instance.signOut();

      selectedIndex == 0;
      html.window.localStorage[session.isLogin] = "false";
      appCtrl.storage.remove(session.isDarkMode);
      appCtrl.storage.remove(session.languageCode);
      Get.offAll(() => Login());
    }

    update();
  }
}
