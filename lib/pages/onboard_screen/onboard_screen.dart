import 'package:multikart_admin/controllers/pages_controller/onboard_controller.dart';
import 'package:multikart_admin/pages/onboard_screen/layouts/english_text_box.dart';
import 'package:multikart_admin/pages/onboard_screen/layouts/onboard_image1.dart';
import 'package:multikart_admin/pages/onboard_screen/layouts/onboard_image2.dart';
import 'package:multikart_admin/pages/onboard_screen/layouts/onboard_image3.dart';
import '../../config.dart';

class OnboardScreen extends StatelessWidget {
  final onboardCtrl = Get.put(OnboardController());

  OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(builder: (_) {
      return Form(
        key: onboardCtrl.formKey,
        child: Stack(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${fonts.image.tr} 1",
                                        style: AppCss.nunitoMedium18
                                            .textColor(
                                                appCtrl.appTheme.darkGray)
                                            .textHeight(1.5)),
                                    const VSpace(Sizes.s15),
                                    OnboardImage1(
                                      image: "",
                                    ),
                                  ],
                                ),
                                const VSpace(Sizes.s30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${fonts.image.tr} 3",
                                        style: AppCss.nunitoMedium18
                                            .textColor(
                                                appCtrl.appTheme.darkGray)
                                            .textHeight(1.5)),
                                    const VSpace(Sizes.s15),
                                    OnboardImage3(
                                      image: "",
                                    ),
                                  ],
                                )
                              ]).marginOnly(top: Insets.i15),
                        ),
                        const HSpace(Sizes.s30),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${fonts.image.tr} 2",
                                        style: AppCss.nunitoMedium18
                                            .textColor(
                                                appCtrl.appTheme.darkGray)
                                            .textHeight(1.5)),
                                    const VSpace(Sizes.s15),
                                    const OnboardImage2(
                                      image: "",
                                    ),
                                  ],
                                )
                              ]).marginOnly(top: Insets.i15),
                        ),
                      ],
                    ).paddingAll(Insets.i30),
                  ).marginOnly(top: Insets.i15),
                  const VSpace(Sizes.s20),
                  EnglishTextBox(
                      txtTitle: onboardCtrl.txtEngTitle,
                      txtDesc: onboardCtrl.txtEngDesc),
                  const VSpace(Sizes.s30),
                  CommonButton(
                    icon: onboardCtrl.isLoading
                        ? const CircularProgressIndicator()
                        : Container(),
                    title: onboardCtrl.id != ""
                        ? fonts.update.tr
                        : fonts.submit.tr,
                    onTap: () => onboardCtrl.id != ""
                        ? onboardCtrl.updateData()
                        : onboardCtrl.uploadLogoFile(),
                    style: AppCss.nunitoRegular14
                        .textColor(appCtrl.appTheme.white),
                  )
                ]).paddingAll(Insets.i25),
            GetBuilder<AppController>(builder: (context) {
              return CustomSnackBar(
                isAlert: appCtrl.isAlert,
                text: "Please add all 3 images",
              );
            })
          ],
        ),
      );
    });
  }
}
