import 'dart:developer';

import 'package:multikart_admin/pages/contact_us/abouts_us.dart';
import 'package:multikart_admin/pages/privacy_policy/privacy_policy.dart';
import 'package:multikart_admin/pages/terms_condition/terms_condition.dart';

import '../../../config.dart';

class SelectedIndexBodyLayout extends StatelessWidget {
  const SelectedIndexBodyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexLayoutController>(builder: (indexCtrl) {
      log("index : ${indexCtrl.subSelectIndex}");
      log("index : ${indexCtrl.selectedIndex}");
      return Expanded(
          child: SelectionArea(
              child: CustomScrollView(
                  controller: indexCtrl.scrollController,
                  slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (Responsive.isDesktop(context))
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(indexCtrl.pageName.tr,
                                        style: AppCss.nunitoblack18.textColor(
                                            appCtrl.appTheme.blackColor)),
                                    const VSpace(Sizes.s8),
                                    Row(children: [
                                      InkWell(
                                          mouseCursor: SystemMouseCursors.click,
                                          child: Text(fonts.admin.tr,
                                              style: AppCss.nunitoMedium14
                                                  .textColor(appCtrl
                                                      .appTheme.blackColor))),
                                      Text('  /  ',
                                          style: AppCss.nunitoMedium14
                                              .textColor(
                                                  appCtrl.appTheme.blackColor)),
                                      Text(
                                        indexCtrl.pageName.tr,
                                        style: AppCss.nunitoMedium14.textColor(
                                            appCtrl.appTheme.blackColor),
                                      )
                                    ])
                                  ]),
                              GetBuilder<AppController>(builder: (context) {
                                return CustomSnackBar(isAlert: appCtrl.isAlert);
                              })
                            ],
                          ).marginOnly(top: Insets.i20),
                        const VSpace(Sizes.s20),
                        if (indexCtrl.selectedIndex != 1)
                          indexCtrl.widgetOptions
                              .elementAt(indexCtrl.selectedIndex),
                        if (indexCtrl.selectedIndex == 1 &&
                            indexCtrl.subSelectIndex != null)
                          indexCtrl.subSelectIndex == 0
                              ? AboutUsPage()
                              : indexCtrl.subSelectIndex == 1
                                  ? ContactUs()
                                  :indexCtrl.subSelectIndex == 2
                                  ? TermsCondition()
                                  : PrivacyPolicy()
                      ]))
            ])),
            SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: Column(children: const <Widget>[
                  Expanded(child: SizedBox.shrink())
                ]))
          ])));
    });
  }
}
