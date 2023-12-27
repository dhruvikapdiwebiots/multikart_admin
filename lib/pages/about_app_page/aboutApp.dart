import 'package:multikart_admin/config.dart';
import 'package:multikart_admin/controllers/pages_controller/about_app_controller.dart';
import 'package:multikart_admin/pages/about_app_page/layouts/about_us_logo.dart';
import 'package:multikart_admin/pages/about_app_page/layouts/drawer_logo.dart';
import 'package:multikart_admin/pages/about_app_page/layouts/home_logo.dart';

class AboutApp extends StatelessWidget {
  final aboutAppCtrl = Get.put(AboutAppController());
  AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutAppController>(builder: (_) {
      return Container(
          margin: const EdgeInsets.all(Insets.i10),
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(maxHeight: 1000),
          child: Card(
            elevation: 3,
            surfaceTintColor: appCtrl.appTheme.whiteColor,
            shadowColor: appCtrl.appTheme.blackColor,
            color: appCtrl.appTheme.whiteColor,
            clipBehavior: Clip.none,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fonts.logo.tr,
                        style: AppCss.nunitoBold20
                            .textColor(appCtrl.appTheme.blackColor)
                            .textHeight(1.5)),
                    const VSpace(Sizes.s25),
                     AboutUsLogo(
                      image: aboutAppCtrl.imageUrl,
                    ).height(Sizes.s200).width(Sizes.s200),
                  ],
                ),
                const HSpace(Sizes.s120),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fonts.drawerLogo.tr,
                        style: AppCss.nunitoBold20
                            .textColor(appCtrl.appTheme.blackColor)
                            .textHeight(1.5)),
                    const VSpace(Sizes.s25),
                     DrawerLogo(
                      image: aboutAppCtrl.drawerImageUrl,
                    ).height(Sizes.s200).width(Sizes.s200),
                  ],
                ),
                const HSpace(Sizes.s120),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fonts.homeLogo.tr,
                        style: AppCss.nunitoBold20
                            .textColor(appCtrl.appTheme.blackColor)
                            .textHeight(1.5)),
                    const VSpace(Sizes.s25),
                     HomeLogo(
                      image: aboutAppCtrl.homeImageUrl,
                    ).height(Sizes.s200).width(Sizes.s200),
                  ],
                ),
              ],
            ).padding(all: Sizes.s20),
          ));
    });
  }
}
