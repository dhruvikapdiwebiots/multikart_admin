import 'package:multikart_admin/pages/notification/layouts/common_input_layout.dart';
import 'package:multikart_admin/pages/notification/layouts/notification_image.dart';
import 'package:multikart_admin/pages/notification/layouts/product_collection_radio.dart';

import '../../../config.dart';

class MobileNotificationLayout extends StatelessWidget {
  const MobileNotificationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CommonInputLayout(
          title: fonts.title.tr,
          hinText: fonts.enterNotificationTitle.tr),
      const VSpace(Sizes.s15),
      CommonInputLayout(
          title: fonts.content.tr,
          hinText: fonts.enterNotificationContent.tr,
          maxLines: 2),
      const VSpace(Sizes.s15),
      const NotificationImage(),
      const VSpace(Sizes.s15),
      CommonInputLayout(
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
  }
}
