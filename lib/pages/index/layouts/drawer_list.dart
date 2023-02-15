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
                  minVerticalPadding: 0,
                  dense: true,
                  leading: SvgPicture.asset(e.value["icon"]!,
                      height: Sizes.s22, color: appCtrl.appTheme.white),
                  title: Responsive.isDesktop(context) && value == false
                      ? Container()
                      : Text(e.value["title"].toString().tr,
                          style: AppCss.nunitoMedium14
                              .textColor(appCtrl.appTheme.white)),
                  onTap: () {
                    indexCtrl.selectedIndex = e.key;
                    indexCtrl.pageName = e.value["title"]!;
                    if (!Responsive.isDesktop(context)) {
                      Get.back();
                    }
                    if (indexCtrl.selectedIndex == 2) {
                      final staticCtrl = Get.isRegistered<StaticController>()
                          ? Get.find<StaticController>()
                          : Get.put(StaticController());
                      staticCtrl.getData();
                    }
                    if (indexCtrl.selectedIndex == 4) {
                      FirebaseAuth.instance.signOut();
                      html.window.localStorage[session.isLogin] = "false";
                      Get.offAll(() => Login());
                    }
                    indexCtrl.update();
                  }).decorated(
                  color: indexCtrl.isHover && indexCtrl.isSelectedHover == e.key
                      ? appCtrl.appTheme.gray.withOpacity(.2)
                      : appCtrl.appTheme.blackColor1,
                  border: Border(
                      left: BorderSide(
                          color: indexCtrl.selectedIndex == e.key
                              ? appCtrl.appTheme.primary
                              : indexCtrl.isHover &&
                                      indexCtrl.isSelectedHover == e.key
                                  ? appCtrl.appTheme.primary
                                  : appCtrl.appTheme.blackColor1))));
        }).toList()
      ]);
    });
  }
}
