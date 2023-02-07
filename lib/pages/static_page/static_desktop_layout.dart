import 'package:multikart_admin/controllers/pages_controller/static_controller.dart';

import '../../config.dart';

class StaticDesktopLayout extends StatelessWidget {
  const StaticDesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaticController>(
      builder: (staticCtrl) {
        return Column(children: [
          Row(children: [
            Expanded(
                child: CommonInputLayout(
                  controller: staticCtrl.txtAboutUs,
                    title: fonts.aboutUsLink.tr,
                    hinText: fonts.aboutUs.tr)),
            const HSpace(Sizes.s10),
            Expanded(
                child: CommonInputLayout(
                    controller: staticCtrl.txtContactUs,
                    title: fonts.contactUsLink.tr,
                    hinText: fonts.contactUs.tr)),
            const HSpace(Sizes.s10),
            Expanded(
                child: CommonInputLayout(
                    controller: staticCtrl.txtTermsCondition,
                    title: fonts.termsConditionLink.tr,
                    hinText: fonts.termsCondition.tr)),
            const HSpace(Sizes.s10),
            Expanded(
                child: CommonInputLayout(
                    controller: staticCtrl.txtPrivacyPolicy,
                    title: fonts.privacyPolicyLink.tr,
                    hinText: fonts.privacyPolicy.tr)),
          ]).paddingSymmetric(horizontal: Insets.i15, vertical: Insets.i20),
          const VSpace(Sizes.s20),
          CommonButton(
              title: fonts.update.tr,
              width: Sizes.s100,
              style: AppCss.nunitoblack14
                  .textColor(appCtrl.appTheme.white))
              .alignment(Alignment.bottomRight),
          const VSpace(Sizes.s20),
        ]);
      }
    );
  }
}
