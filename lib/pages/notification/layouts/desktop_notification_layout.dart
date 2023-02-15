


import '../../../config.dart';

class DesktopNotificationLayout extends StatelessWidget {
  const DesktopNotificationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (notificationCtrl) {
        return Column(
          children: [
            Row(children: [
              Expanded(
                  child: CommonInputLayout(
                    controller: notificationCtrl.txtTitle,
                      title: fonts.title.tr,
                      hinText: fonts.enterNotificationTitle.tr)),
              const HSpace(Sizes.s15),
              Expanded(
                  child: CommonInputLayout(
                    controller: notificationCtrl.txtContent,
                      title: fonts.content.tr,
                      hinText: fonts.enterNotificationContent.tr)),
            ]).paddingSymmetric(
                horizontal: Insets.i15, vertical: Insets.i20),
            Row(children: [

              Expanded(
                  child: CommonInputLayout(
                    controller: notificationCtrl.txtProductCollectionId,
                      title: fonts.productCollectionId.tr,
                      hinText: fonts.productCollectionId.tr)),
              const HSpace(Sizes.s10),
              const  Expanded(
                  child:  ProductCollectionRadio()),
            ]).paddingSymmetric(
                horizontal: Insets.i15, vertical: Insets.i20),
            CommonButton(
              onTap: (){
                var data ={
                  "title": notificationCtrl.txtTitle.text,
                  "content":notificationCtrl.txtContent.text
                };
                notificationCtrl.sendNotification(data: data);
              },
                title: fonts.submit.tr,
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
