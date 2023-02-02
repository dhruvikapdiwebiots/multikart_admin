import 'dart:developer';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:multikart_admin/common/theme/index.dart';
import 'package:multikart_admin/config.dart';

import 'package:multikart_admin/extensions/spacing.dart';
import 'package:multikart_admin/extensions/widget_extension.dart';
import 'package:multikart_admin/responsive.dart';

class Index extends StatelessWidget {
  final indexCtrl = Get.put(IndexController());

  Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (_) {
      return Scaffold(
          key: indexCtrl.scaffoldKey,
          appBar: AppBar(
              toolbarHeight: 70,
              elevation: 0.0,
              shadowColor: Colors.transparent,
              backgroundColor: appCtrl.appTheme.whiteColor,
              leadingWidth: 392,
              leading: Row(children: [
                ValueListenableBuilder<bool>(
                    valueListenable: indexCtrl.isOpen,
                    builder: (context, value, child) {
                      if (Responsive.isDesktop(context) && value) {
                        return InkWell(
                            onTap: () {},
                            child: Container(
                                width: 240,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 61),
                                height: double.infinity,
                                color: appCtrl.appTheme.blackColor,
                                child: Image.asset(imageAssets.logo2)));
                      }
                      return InkWell(
                          onTap: () {
                            indexCtrl.scaffoldDrawerKey.currentState
                                ?.closeDrawer();
                          },
                          child: Responsive.isDesktop(context)
                              ? Container(
                              width: Sizes.s70,
                              color: appCtrl.appTheme.blackColor,
                              padding: const EdgeInsets.all(Insets.i15),
                              height: double.infinity,
                              child: Image.asset(imageAssets.logo1,
                                  fit: BoxFit.contain))
                              : Container());
                    }),
                MaterialButton(
                    height: double.infinity,
                    minWidth: 60,
                    hoverColor: Colors.transparent,
                    onPressed: () async {
                      if (Responsive.isMobile(context) ||
                          Responsive.isTablet(context)) {
                        if (indexCtrl
                            .scaffoldKey.currentState!.isDrawerOpen) {
                          indexCtrl.scaffoldKey.currentState!.closeDrawer();
                        } else {
                          indexCtrl.scaffoldKey.currentState!.openDrawer();
                        }
                      } else if (Responsive.isDesktop(context)) {
                        //indexCtrl.scaffoldDrawerKey.currentState!.closeDrawer();
                        indexCtrl.scaffoldKey.currentState!.closeDrawer();
                        indexCtrl.isOpen.value = !indexCtrl.isOpen.value;
                      }
                    },
                    child: const Icon(Icons.menu))
              ]),
              actions: [
                Responsive.isMobile(context) || Responsive.isTablet(context)
                    ? MaterialButton(
                    height: double.infinity,
                    minWidth: 60,
                    hoverColor: Colors.transparent,
                    onPressed: () {},
                    child: const Icon(Icons.search))
                    : Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: 180,
                    height: 48,
                    child: TextField(
                        cursorWidth: 1,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide.none),
                            filled: true,
                            contentPadding:
                            const EdgeInsets.fromLTRB(12, 10, 0, 4),
                            hintText: "Strings.searchHint",
                            hintStyle: const TextStyle(fontSize: 15),
                            suffixIcon: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Icon(Icons.search)),
                            // fillColor: Colors.textFieldBG,
                            isCollapsed: true)))
              ]),
          drawerScrimColor: Colors.transparent,
          drawer: Visibility(
              visible: MediaQuery
                  .of(context)
                  .size
                  .width <= 992,
              child: ValueListenableBuilder<bool>(
                  valueListenable: indexCtrl.isOpen,
                  builder: (context, value, child) {
                    return MouseRegion(
                      onHover: (val) {
                        indexCtrl.isHover = true;
                        indexCtrl.update();
                        log("val : ${indexCtrl.isHover}");
                      },
                      onExit: (exit) {
                        indexCtrl.isHover = false;
                        indexCtrl.update();
                        log("val : ${indexCtrl.isHover}");
                      },
                      onEnter: (enter) {
                        indexCtrl.isHover = true;
                        indexCtrl.update();
                        log("val : ${indexCtrl.isHover}");
                      },
                      child: Drawer(
                          backgroundColor: appCtrl.appTheme.blackColor,
                          elevation: 2,
                          child: ListView(children: [
                            Image.asset(
                              imageAssets.logo2,
                              height: Sizes.s100,
                            ).backgroundColor(appCtrl.appTheme.blackColor),
                            const VSpace(Sizes.s20),
                            ...appArray.drawerList
                                .asMap()
                                .entries
                                .map((e) {
                              return ListTile(
                                  minVerticalPadding: 0,
                                  dense: true,
                                  leading: SvgPicture.asset(e.value["icon"]!,
                                      height: Sizes.s25,
                                      color: appCtrl.appTheme.whiteColor),
                                  title: Text(e.value["title"]
                                      .toString()
                                      .tr,
                                      style: AppCss.nunitoMedium14.textColor(
                                          appCtrl.appTheme.whiteColor)),
                                  onTap: () {
                                    indexCtrl.selectedIndex = e.key;
                                    indexCtrl.pageName = e.value["title"]!;
                                    indexCtrl.update();
                                  }).decorated(border: Border(left: BorderSide(
                                  color: indexCtrl.selectedIndex == e.key
                                      ? appCtrl.appTheme.primary
                                      : appCtrl.appTheme.blackColor)));
                            }).toList()
                          ])),
                    );
                  })),
          body: SafeArea(
              child: Scaffold(
                  key: indexCtrl.scaffoldDrawerKey,
                  body: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ValueListenableBuilder<bool>(
                            valueListenable: indexCtrl.isOpen,
                            builder: (context, value, child) {
                              return Responsive.isDesktop(context)
                                  ? ValueListenableBuilder<bool>(
                                  valueListenable: indexCtrl.isOpen,
                                  builder: (context, value, child) {
                                    return Container(
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height,
                                        width: value ? 240 : 70,
                                        color:
                                        appCtrl.appTheme.blackColor,
                                        child: SingleChildScrollView(
                                            controller:
                                            ScrollController(),
                                            child: Column(
                                                crossAxisAlignment: value
                                                    ? CrossAxisAlignment
                                                    .start
                                                    : CrossAxisAlignment
                                                    .center,
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                children: [
                                                  ...appArray.drawerList
                                                      .asMap()
                                                      .entries
                                                      .map((e) {
                                                    return MouseRegion(
                                                      onHover: (val) {
                                                        indexCtrl.isHover =
                                                        true;
                                                        indexCtrl.isSelectedHover =e.key;
                                                        indexCtrl.update();
                                                        log("val : ${indexCtrl
                                                            .isHover}");
                                                        log("isIndex Hover : ${ indexCtrl.isHover == true}");
                                                      },
                                                      onExit: (exit) {
                                                        indexCtrl.isHover =
                                                        false;
                                                        indexCtrl.update();
                                                        log("val : ${indexCtrl
                                                            .isHover}");
                                                      },
                                                      child: ListTile(
                                                          minVerticalPadding:
                                                          0,
                                                          dense: true,
                                                          leading: SvgPicture
                                                              .asset(
                                                              e.value[
                                                              "icon"]!,
                                                              height:
                                                              Sizes.s22,
                                                              color: appCtrl
                                                                  .appTheme
                                                                  .whiteColor),
                                                          title: Responsive
                                                              .isDesktop(
                                                              context) &&
                                                              value ==
                                                                  false
                                                              ? Container()
                                                              : Text(
                                                              e.value["title"]
                                                                  .toString()
                                                                  .tr,
                                                              style: AppCss
                                                                  .nunitoMedium14
                                                                  .textColor(
                                                                  appCtrl
                                                                      .appTheme
                                                                      .whiteColor)),
                                                          onTap: () {
                                                            indexCtrl
                                                                .selectedIndex =
                                                                e.key;
                                                            indexCtrl
                                                                .pageName = e
                                                                .value[
                                                            "title"]!;
                                                            indexCtrl
                                                                .update();
                                                          }).decorated(
                                                        color:indexCtrl.isHover && indexCtrl.isSelectedHover == e.key ?appCtrl.appTheme.gray.withOpacity(.2) : appCtrl
                                                            .appTheme
                                                            .blackColor ,
                                                          border: Border(
                                                              left: BorderSide(
                                                                  color: indexCtrl
                                                                      .selectedIndex ==
                                                                      e.key
                                                                      ? appCtrl
                                                                      .appTheme
                                                                      .primary
                                                                      : indexCtrl.isHover && indexCtrl.isSelectedHover == e.key ?appCtrl.appTheme.primary : appCtrl
                                                                      .appTheme
                                                                      .blackColor))),
                                                    );
                                                  }).toList()
                                                ])));
                                  })
                                  : const SizedBox.shrink();
                            }),
                        Expanded(
                            child: SelectionArea(
                                child: CustomScrollView(
                                    controller: indexCtrl.scrollController,
                                    slivers: [
                                      SliverList(
                                          delegate: SliverChildListDelegate([
                                            Container(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 24.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      if (Responsive.isDesktop(
                                                          context))
                                                        Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            const VSpace(
                                                                Sizes.s20),
                                                            Text(indexCtrl
                                                                .pageName.tr,
                                                                style: Theme
                                                                    .of(context)
                                                                    .textTheme
                                                                    .bodyLarge!
                                                                    .copyWith(
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                            const VSpace(
                                                                Sizes.s8),
                                                            Row(
                                                              children: [
                                                                const InkWell(
                                                                  mouseCursor:
                                                                  SystemMouseCursors
                                                                      .click,
                                                                  child: Text(
                                                                      "Admin"),
                                                                ),
                                                                const Text(
                                                                    '  /  '),
                                                                Text(indexCtrl
                                                                    .pageName
                                                                    .tr),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      const VSpace(Sizes.s20),
                                                      indexCtrl.widgetOptions
                                                          .elementAt(
                                                          indexCtrl
                                                              .selectedIndex)
                                                    ]))
                                          ])),
                                      SliverFillRemaining(
                                          hasScrollBody: false,
                                          fillOverscroll: true,
                                          child: Column(
                                              children: const <Widget>[
                                                Expanded(
                                                    child: SizedBox.shrink())
                                              ]))
                                    ])))
                      ]))));
    });
  }
}
