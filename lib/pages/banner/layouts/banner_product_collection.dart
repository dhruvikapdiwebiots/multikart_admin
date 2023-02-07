

import '../../../config.dart';

class BannerProductCollection extends StatelessWidget {
  const BannerProductCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(
        builder: (bannerCtrl) {
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
                              groupValue: bannerCtrl.idType,
                              activeColor: appCtrl.appTheme.primary,
                              onChanged: (value) {
                                bannerCtrl.idType = value!;
                                bannerCtrl.update();
                              })),
                      Expanded(
                          child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(fonts.collection.tr),
                              dense: true,
                              visualDensity:
                              const VisualDensity(horizontal: 0),
                              value: "collection",
                              groupValue: bannerCtrl.idType,
                              activeColor: appCtrl.appTheme.primary,
                              onChanged: (value) {
                                bannerCtrl.idType = value!;
                                bannerCtrl.update();
                              }))
                    ])
              ]);
        }
    );
  }
}
