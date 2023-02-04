import 'package:multikart_admin/controllers/pages_controller/notification_controller.dart';

import '../../../config.dart';

class ProductCollectionRadio extends StatelessWidget {
  const ProductCollectionRadio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (notificationCtrl) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fonts.productCollection.tr),
              const VSpace(Sizes.s10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(fonts.product.tr),
                            value: "product",
                            dense: true,
                            visualDensity:
                            const VisualDensity(horizontal: 0),
                            groupValue: notificationCtrl.idType,
                            activeColor: appCtrl.appTheme.primary,
                            onChanged: (value) {
                              notificationCtrl.idType = value!;
                              notificationCtrl.update();
                            })),
                    Expanded(
                        child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(fonts.collection.tr),
                            dense: true,
                            visualDensity:
                            const VisualDensity(horizontal: 0),
                            value: "collection",
                            groupValue: notificationCtrl.idType,
                            activeColor: appCtrl.appTheme.primary,
                            onChanged: (value) {
                              notificationCtrl.idType = value!;
                              notificationCtrl.update();
                            }))
                  ])
            ]);
      }
    );
  }
}
