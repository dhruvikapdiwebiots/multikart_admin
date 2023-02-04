import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config.dart';

class LanguageLayout extends StatelessWidget {
  const LanguageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: appCtrl.appTheme.whiteColor,
        position: PopupMenuPosition.under,
        tooltip: fonts.showLanguage.tr,
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: Insets.i16 * 0.5),
            constraints: const BoxConstraints(minWidth: Sizes.s48),
            child: Row(children: [
              SvgPicture.asset(svgAssets.language, height: Sizes.s25),
              Visibility(
                  visible: (MediaQuery.of(context).size.width > Sizes.s768),
                  child: Padding(
                      padding: const EdgeInsets.only(left: Insets.i16 * 0.5),
                      child: Text(fonts.selectLanguage.tr,
                          style: AppCss.nunitoSemiBold14
                              .textColor(appCtrl.appTheme.blackColor))))
            ])),
        itemBuilder: (context) {
          return [
            ...appArray.actionList
                .asMap()
                .entries
                .map((e) => PopupMenuItem<int>(
                value: 0,
                onTap: () {},
                child: Text(
                  e.value["title"].toString().tr,
                  style: AppCss.nunitoMedium14
                      .textColor(appCtrl.appTheme.blackColor),
                ).inkWell(onTap: () {})))
                .toList(),
          ];
        });
  }
}
