import 'package:multikart_admin/controllers/pages_controller/static_controller.dart';

import '../../config.dart';

class StaticMobileLayout extends StatelessWidget {
  const StaticMobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaticController>(
      builder: (staticCtrl) {
        return Column(children: [
          CommonInputLayout(
              controller: staticCtrl.txtAboutUs,
              title: fonts.aboutUsLink.tr, hinText: fonts.aboutUs.tr),
          const VSpace(Sizes.s15),
          CommonInputLayout(
              controller: staticCtrl.txtContactUs,
              title: fonts.contactUsLink.tr, hinText: fonts.contactUs.tr),
          const VSpace(Sizes.s15),
          CommonInputLayout(
              controller: staticCtrl.txtTermsCondition,
              title: fonts.termsConditionLink.tr,
              hinText: fonts.termsCondition.tr),
          const VSpace(Sizes.s15),
          CommonInputLayout(
              controller: staticCtrl.txtPrivacyPolicy,
              title: fonts.privacyPolicyLink.tr,
              hinText: fonts.privacyPolicy.tr),
          const VSpace(Sizes.s20),
          CommonButton(
              onTap: ()=>staticCtrl.updateData(),
              title: fonts.update.tr,
              width: Sizes.s100,
              style: AppCss.nunitoblack14
                  .textColor(appCtrl.appTheme.white))
              .alignment(Alignment.bottomRight)
        ]);
      }
    );
  }
}
