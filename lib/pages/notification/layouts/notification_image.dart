
import '../../../config.dart';

class NotificationImage extends StatelessWidget {
  const NotificationImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (notificationCtrl) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(fonts.image.tr),
            const VSpace(Sizes.s15),
            const NotificationImageLayout(),
            if (notificationCtrl.isUploadSize)
              Column(children: [
                const VSpace(Sizes.s5),
                Text(fonts.imageError.tr,
                    style: AppCss.nunitoMedium12
                        .textColor(appCtrl.appTheme.redColor))
              ])
          ]);
    });
  }
}
