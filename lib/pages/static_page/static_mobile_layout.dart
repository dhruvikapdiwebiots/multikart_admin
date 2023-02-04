import '../../config.dart';

class StaticMobileLayout extends StatelessWidget {
  const StaticMobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CommonInputLayout(
          title: fonts.aboutUsLink.tr, hinText: fonts.aboutUs.tr),
      const VSpace(Sizes.s15),
      CommonInputLayout(
          title: fonts.contactUsLink.tr, hinText: fonts.contactUs.tr),
      const VSpace(Sizes.s15),
      CommonInputLayout(
          title: fonts.termsConditionLink.tr,
          hinText: fonts.termsCondition.tr),
      const VSpace(Sizes.s15),
      CommonInputLayout(
          title: fonts.privacyPolicyLink.tr,
          hinText: fonts.privacyPolicy.tr),
      const VSpace(Sizes.s20),
      CommonButton(
          title: fonts.update.tr,
          width: Sizes.s100,
          style: AppCss.nunitoblack14
              .textColor(appCtrl.appTheme.white))
          .alignment(Alignment.bottomRight)
    ]);
  }
}
