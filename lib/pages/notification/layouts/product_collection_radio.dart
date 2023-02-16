
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
              Text(fonts.productCollection.tr,style: AppCss.nunitoMedium14.textColor(appCtrl.appTheme.blackColor),),
              const VSpace(Sizes.s15),
              Theme(
                data: ThemeData(unselectedWidgetColor:appCtrl.appTheme.blackColor ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(fonts.product.tr,style: AppCss.nunitoMedium14.textColor(appCtrl.appTheme.blackColor)),
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
                              title: Text(fonts.collection.tr,style: AppCss.nunitoMedium14.textColor(appCtrl.appTheme.blackColor)),
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
                    ]),
              )
            ]);
      }
    );
  }
}
