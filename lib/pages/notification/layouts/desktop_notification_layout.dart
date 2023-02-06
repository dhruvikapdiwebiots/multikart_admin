


import '../../../config.dart';
import 'notification_image.dart';

class DesktopNotificationLayout extends StatelessWidget {
  const DesktopNotificationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (context) {
        return Column(
          children: [
            Row(children: [
              Expanded(
                  child: CommonInputLayout(
                      title: fonts.title.tr,
                      hinText: fonts.enterNotificationTitle.tr)),
              const HSpace(Sizes.s15),
              Expanded(
                  child: CommonInputLayout(
                      title: fonts.content.tr,
                      hinText: fonts.enterNotificationContent.tr)),
            ]).paddingSymmetric(
                horizontal: Insets.i15, vertical: Insets.i20),
            Row(children: [
              const    Expanded(
                  child: NotificationImage()),
              const HSpace(Sizes.s10),
              Expanded(
                  child: CommonInputLayout(
                      title: fonts.productCollectionId.tr,
                      hinText: fonts.productCollectionId.tr)),
              const HSpace(Sizes.s10),
              const  Expanded(
                  child:  ProductCollectionRadio()),
            ]).paddingSymmetric(
                horizontal: Insets.i15, vertical: Insets.i20),
            CommonButton(
                title: fonts.update.tr,
                width: Sizes.s100,
                style: AppCss.nunitoblack14
                    .textColor(appCtrl.appTheme.white))
                .alignment(Alignment.bottomRight),
            const VSpace(Sizes.s20),
          ],
        );
      }
    );
  }
}
