import '../../config.dart';

class NotificationPage extends StatelessWidget {
  final notificationCtrl = Get.put(NotificationController());

  NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (_) {
      return Card(
        elevation: 3,
        surfaceTintColor: appCtrl.appTheme.whiteColor,
        shadowColor: appCtrl.appTheme.blackColor,
        color: appCtrl.appTheme.whiteColor,
        child: Responsive.isDesktop(context)
            ? const DesktopNotificationLayout()
            : const MobileNotificationLayout()
                .paddingSymmetric(horizontal: Insets.i15, vertical: Insets.i20),
      );
    });
  }
}
