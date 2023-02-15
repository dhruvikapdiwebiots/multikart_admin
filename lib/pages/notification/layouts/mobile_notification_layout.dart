import '../../../config.dart';

class MobileNotificationLayout extends StatelessWidget {
  const MobileNotificationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (notificationCtrl) {
      return Column(children: [
        CommonInputLayout(
            controller: notificationCtrl.txtTitle,
            title: fonts.title.tr,
            hinText: fonts.enterNotificationTitle.tr),
        const VSpace(Sizes.s15),
        CommonInputLayout(
            controller: notificationCtrl.txtContent,
            title: fonts.content.tr,
            hinText: fonts.enterNotificationContent.tr,
            maxLines: 2),
        const VSpace(Sizes.s15),

        CommonInputLayout(
            controller: notificationCtrl.txtProductCollectionId,
            title: fonts.productCollectionId.tr,
            hinText: fonts.productCollectionId.tr),
        const VSpace(Sizes.s20),
        const ProductCollectionRadio(),
        const VSpace(Sizes.s20),
        CommonButton(
          title: fonts.update.tr,
          width: Sizes.s100,
          style: AppCss.nunitoblack14.textColor(appCtrl.appTheme.white),
        ).alignment(Alignment.bottomRight)
      ]);
    });
  }
}
