import '../../../config.dart';

class BannerCommonClass {
  //header decoration
  BoxDecoration headerDecoration() => BoxDecoration(
      color: appCtrl.appTheme.whiteColor,
      border: Border(
          bottom: BorderSide(color: appCtrl.appTheme.gray.withOpacity(0.3), width: 1)));

  //selected decoration
  BoxDecoration selectedDecoration() => BoxDecoration(
      border: Border(
          bottom: BorderSide(
              color: appCtrl.appTheme.greenColor.withOpacity(.3), width: 1)),
      color: appCtrl.appTheme.greenColor);

  //add banner title
  Widget addBannerTitle() => Container(
      height: Sizes.s50,
      width: Sizes.s500,
      decoration: BoxDecoration(
          color: appCtrl.appTheme.whiteColor,
          border: Border(
              bottom:
                  BorderSide(color: appCtrl.appTheme.gray.withOpacity(0.3)))),
      child: Center(
          child: Text(fonts.addBanner.tr,
              style: AppCss.nunitoblack20
                  .textColor(appCtrl.appTheme.blackColor))));
}
