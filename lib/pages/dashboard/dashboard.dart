import 'dart:developer';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:multikart_admin/common/assets/svg_asset.dart';
import 'package:multikart_admin/common/theme/index.dart';
import 'package:multikart_admin/config.dart';
import 'package:multikart_admin/controllers/pages_controller/dashboard_controller.dart';
import 'package:multikart_admin/extensions/spacing.dart';
import 'package:multikart_admin/extensions/widget_extension.dart';
import 'package:multikart_admin/responsive.dart';

class Dashboard extends StatelessWidget {
  final dashboardCtrl = Get.put(DashboardController());

  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (_) {
      return Scaffold(
        key: dashboardCtrl.scaffoldKey,
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: appCtrl.appTheme.whiteColor,
          leadingWidth: 392,
          leading: Row(
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: dashboardCtrl.isOpen,
                builder: (context, value, child) {
                  log("isDe : #${Responsive.isDesktop(context) && value}");
                  if (Responsive.isDesktop(context) && value) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: 240,
                        padding: const EdgeInsets.symmetric(horizontal: 61),
                        height: double.infinity,
                        color: appCtrl.appTheme.blackColor,
                        child: Image.asset(imageAssets.logo2),
                      ),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      dashboardCtrl.scaffoldDrawerKey.currentState
                          ?.closeDrawer();
                    },
                    child: Responsive.isDesktop(context) ? Container(
                      width: 70,
                      color: appCtrl.appTheme.blackColor,
                      height: double.infinity,
                      child: Image.asset(
                        imageAssets.logo1,
                        fit: BoxFit.contain,
                      ),
                    ) : Container(),
                  );
                },
              ),
              MaterialButton(
                height: double.infinity,
                minWidth: 60,
                hoverColor: Colors.transparent,
                onPressed: () async {
                  if (Responsive.isMobile(context) ||
                      Responsive.isTablet(context)) {
                    if (dashboardCtrl.scaffoldKey.currentState!.isDrawerOpen) {
                      dashboardCtrl.scaffoldKey.currentState!.closeDrawer();
                    } else {
                      dashboardCtrl.scaffoldKey.currentState!.openDrawer();
                    }
                  } else if (Responsive.isDesktop(context)) {
                    //dashboardCtrl.scaffoldDrawerKey.currentState!.closeDrawer();
                    dashboardCtrl.scaffoldKey.currentState!.closeDrawer();
                    dashboardCtrl.isOpen.value = !dashboardCtrl.isOpen.value;
                  }
                },
                child: const Icon(Icons.menu),
              )
            ],
          ),
          actions: [
            Responsive.isMobile(context) || Responsive.isTablet(context)
                ? MaterialButton(
                    height: double.infinity,
                    minWidth: 60,
                    hoverColor: Colors.transparent,
                    onPressed: () {},
                    child: const Icon(Icons.search),
                  )
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
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.fromLTRB(12, 10, 0, 4),
                        hintText: "Strings.searchHint",
                        hintStyle: const TextStyle(fontSize: 15),
                        suffixIcon: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(Icons.search),
                        ),
                        // fillColor: Colors.textFieldBG,
                        isCollapsed: true,
                      ),
                    ),
                  ),
          ],
        ),
        drawerScrimColor: Colors.transparent,
        drawer: Visibility(
          visible: MediaQuery.of(context).size.width <= 992,
          child: ValueListenableBuilder<bool>(
            valueListenable: dashboardCtrl.isOpen,
            builder: (context, value, child) {
              return Drawer(
                backgroundColor: appCtrl.appTheme.blackColor,
                elevation: 2,
                child: ListView(
                  children: [
                    Image.asset(
                      imageAssets.logo2,
                      height: Sizes.s100,
                    ).backgroundColor(appCtrl.appTheme.blackColor),
                    const VSpace(Sizes.s20),
                    ...appArray.drawerList.asMap().entries.map((e) {
                      return ListTile(
                        minVerticalPadding: 0,
                        dense: true,
                        leading: SvgPicture.asset(e.value["icon"]!,height: Sizes.s25,
                            color: appCtrl.appTheme.whiteColor),
                        title: Text(e.value["title"].toString().tr,
                            style: AppCss.nunitoMedium14
                                .textColor(appCtrl.appTheme.whiteColor)),
                        onTap: () {},
                      );
                    }).toList()
                  ],
                ),
              );
            },
          ),
        ),
        body: SafeArea(
          child: Scaffold(
            key: dashboardCtrl.scaffoldDrawerKey,
            body: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: dashboardCtrl.isOpen,
                  builder: (context, value, child) {
                    return Responsive.isDesktop(context)
                        ? ValueListenableBuilder<bool>(
                            valueListenable: dashboardCtrl.isOpen,
                            builder: (context, value, child) {
                              return Container(
                                height: MediaQuery.of(context).size.height,
                                width: value ? 240 : 70,
                                color: appCtrl.appTheme.blackColor,
                                child: SingleChildScrollView(
                                  controller: ScrollController(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ...appArray.drawerList
                                          .asMap()
                                          .entries
                                          .map((e) {
                                        return ListTile(
                                          minVerticalPadding: 0,
                                          dense: true,
                                          leading: SvgPicture.asset(
                                            e.value["icon"]!,
                                            height: Sizes.s22,
                                            color:
                                                appCtrl.appTheme.whiteColor,
                                          ),
                                          title: Responsive.isDesktop(context) && value == false?Container() : Text(
                                              e.value["title"].toString().tr,
                                              style: AppCss.nunitoMedium14
                                                  .textColor(appCtrl
                                                      .appTheme.whiteColor)),
                                          onTap: () {},
                                        );
                                      }).toList()
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : const SizedBox.shrink();
                  },
                ),
                Expanded(
                  child: SelectionArea(
                    child: CustomScrollView(
                      controller: dashboardCtrl.scrollController,
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Container(
                                height: 500,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const VSpace(Sizes.s20),
                                    Text(
                                      "upperCase(tabsRouter.currentPath)",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const VSpace(Sizes.s8),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SliverFillRemaining(
                          hasScrollBody: false,
                          fillOverscroll: true,
                          child: Column(
                            children: <Widget>[
                              const Expanded(
                                child: SizedBox.shrink(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
