import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config.dart';
import 'dart:html' as html;

class DrawerList extends StatelessWidget {
  final bool? value;

  const DrawerList({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexLayoutController>(builder: (indexCtrl) {
      return Column(children: [
        ...appArray.drawerList.asMap().entries.map((e) {
          log("draer :${e.value}");
          dynamic orderList = e.value["otherList"];
          List otherList = orderList;
          return MouseRegion(
              onHover: (val) {
                indexCtrl.isHover = true;
                indexCtrl.isSelectedHover = e.key;
                indexCtrl.update();
              },
              onExit: (exit) {
                indexCtrl.isHover = false;
                indexCtrl.update();
                log("val : ${indexCtrl.isHover}");
              },
              child: ListTile(
                  dense: true,
                  leading: SvgPicture.asset(e.value["icon"].toString(),
                      height: Sizes.s22, color: appCtrl.appTheme.white),
                  title: Responsive.isDesktop(context) && value == false
                      ? Container()
                      : otherList.isNotEmpty
                          ? ExpansionTile(
                              onExpansionChanged: (val) {
                                indexCtrl.selectedIndex = 1;
                                indexCtrl.update();
                              },
                              iconColor: appCtrl.appTheme.white,
                              collapsedIconColor: appCtrl.appTheme.white,
                              tilePadding: EdgeInsets.zero,
                              title: Text(e.value["title"].toString().tr,
                                      style: AppCss.nunitoMedium14
                                          .textColor(appCtrl.appTheme.white))
                                  .inkWell(onTap: () {
                                indexCtrl.selectedIndex = e.key;
                                indexCtrl.pageName =
                                    e.value["title"].toString();
                                if (!Responsive.isDesktop(context)) {
                                  Get.back();
                                }
                                if (indexCtrl.selectedIndex == 1) {
                                  final staticCtrl =
                                      Get.isRegistered<StaticController>()
                                          ? Get.find<StaticController>()
                                          : Get.put(StaticController());
                                  staticCtrl.getData();
                                }
                                if (indexCtrl.selectedIndex == 3) {
                                  FirebaseAuth.instance.signOut();
                                  indexCtrl.selectedIndex == 0;
                                  html.window.localStorage[session.isLogin] =
                                      "false";
                                  appCtrl.storage.remove(session.isDarkMode);
                                  appCtrl.storage.remove(session.languageCode);
                                  Get.offAll(() => Login());
                                }
                                indexCtrl.update();
                              }),
                              children: [
                                ...otherList.asMap().entries.map((other) {
                                  return MouseRegion(
                                    onHover: (val) {
                                      indexCtrl.isSubHover = true;
                                      indexCtrl.isSubSelectedHover = other.key;
                                      indexCtrl.update();
                                    },
                                    onExit: (exit) {
                                      indexCtrl.isSubHover = false;
                                      indexCtrl.update();
                                      log("val : ${indexCtrl.isSubHover}");
                                    },
                                    child: ListTile(
                                        dense: true,
                                        title: Responsive.isDesktop(context) &&
                                                value == false
                                            ? Container()
                                            : Text(other.value["title"].toString().tr,
                                                style: AppCss.nunitoMedium14.textColor(
                                                    appCtrl.appTheme.white)),
                                        onTap: () {
                                          indexCtrl.subSelectIndex = other.key;

                                          indexCtrl.update();
                                        }).decorated(
                                        color: (indexCtrl.isSubHover &&
                                                indexCtrl.isSubSelectedHover ==
                                                    other.key)
                                            ? appCtrl.appTheme.gray
                                                .withOpacity(.2)
                                            : appCtrl.appTheme.bgColor,
                                        border: Border(
                                            left: BorderSide(
                                                width: 5,
                                                color: indexCtrl
                                                            .subSelectIndex ==
                                                        other.key
                                                    ? appCtrl.appTheme.primary
                                                    : indexCtrl.isSubHover &&
                                                            indexCtrl.isSubSelectedHover ==
                                                                other.key
                                                        ? appCtrl.appTheme.primary
                                                        : appCtrl.appTheme.bgColor))),
                                  );
                                }).toList()
                              ],
                            ).inkWell(onTap: () {
                              indexCtrl.selectedIndex = e.key;
                              indexCtrl.pageName = e.value["title"].toString();
                              if (!Responsive.isDesktop(context)) {
                                Get.back();
                              }
                              if (indexCtrl.selectedIndex == 1) {
                                final staticCtrl =
                                    Get.isRegistered<StaticController>()
                                        ? Get.find<StaticController>()
                                        : Get.put(StaticController());
                                staticCtrl.getData();
                              }
                              if (indexCtrl.selectedIndex == 3) {
                                FirebaseAuth.instance.signOut();
                                indexCtrl.selectedIndex == 0;
                                html.window.localStorage[session.isLogin] =
                                    "false";
                                appCtrl.storage.remove(session.isDarkMode);
                                appCtrl.storage.remove(session.languageCode);
                                Get.offAll(() => Login());
                              }
                              indexCtrl.update();
                            })
                          : Text(e.value["title"].toString().tr,
                              style: AppCss.nunitoMedium14
                                  .textColor(appCtrl.appTheme.white)),
                  onTap: () {
                    indexCtrl.selectedIndex = e.key;
                    indexCtrl.pageName = e.value["title"].toString();
                    if (!Responsive.isDesktop(context)) {
                      Get.back();
                    }
                    if (indexCtrl.selectedIndex == 1) {
                      final staticCtrl = Get.isRegistered<StaticController>()
                          ? Get.find<StaticController>()
                          : Get.put(StaticController());
                      staticCtrl.getData();
                    }
                    if (indexCtrl.selectedIndex == 3) {
                      FirebaseAuth.instance.signOut();
                      indexCtrl.selectedIndex == 0;
                      html.window.localStorage[session.isLogin] = "false";
                      appCtrl.storage.remove(session.isDarkMode);
                      appCtrl.storage.remove(session.languageCode);
                      Get.offAll(() => Login());
                    }
                    indexCtrl.update();
                  }).decorated(
                  color: (indexCtrl.isHover &&
                          indexCtrl.isSelectedHover == e.key &&
                          otherList.isEmpty)
                      ? appCtrl.appTheme.gray.withOpacity(.2)
                      : appCtrl.appTheme.bgColor,
                  border: Border(
                      left: BorderSide(
                          width: 5,
                          color: indexCtrl.selectedIndex == e.key
                              ? appCtrl.appTheme.primary
                              : indexCtrl.isHover &&
                                      indexCtrl.isSelectedHover == e.key &&
                                      otherList.isEmpty
                                  ? appCtrl.appTheme.primary
                                  : appCtrl.appTheme.bgColor))));
        }).toList()
      ]);
    });
  }
}
