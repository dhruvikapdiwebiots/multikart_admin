import '../../../../config.dart';

class LoginBodyLayout extends StatelessWidget {
  const LoginBodyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const VSpace(Sizes.s20),
          LoginCommonClass()
              .logoLayout(image: imageAssets.logo1),
          const VSpace(Sizes.s20),
          Text(fonts.welcomeBack.tr,
              style: AppCss.nunitoblack28
                  .textColor(appCtrl.appTheme.blackColor)),
          const VSpace(Sizes.s10),
          Text(fonts.helloAgain.tr,
              textAlign: TextAlign.center,
              style: AppCss.nunitoSemiBold14
                  .textColor(appCtrl.appTheme.contentColor))
              .paddingSymmetric(horizontal: Insets.i25),
          const VSpace(Sizes.s25),
          LoginCommonClass().titleLayout(title: fonts.email),
          const VSpace(Sizes.s8),
          SizedBox(
              height: Sizes.s35,
              child: CommonTextBox(
                  hinText: fonts.enterYourEmail.tr,
                  labelText: fonts.email.tr)),
          const VSpace(Sizes.s22),
          LoginCommonClass().titleLayout(title: fonts.password),
          const VSpace(Sizes.s8),
          SizedBox(
              height: Sizes.s35,
              child: CommonTextBox(
                  hinText: fonts.enterPassword.tr,
                  labelText: fonts.password.tr)),
          const VSpace(Sizes.s30),
          CommonButton(
              title: fonts.signIn.tr,
              margin: 0,
              onTap: () => Get.toNamed(routeName.index),
              padding: 0,
              height: Sizes.s35,
              style: AppCss.nunitoMedium14
                  .textColor(appCtrl.appTheme.white)),
          const VSpace(Sizes.s12),
          LoginCommonClass().forgotPassword(),
          const VSpace(Sizes.s30)
        ]);
  }
}
