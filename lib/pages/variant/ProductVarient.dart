import 'package:multikart_admin/common/assets/image_asset.dart';
import 'package:multikart_admin/controllers/pages_controller/variant_controller.dart';
import 'package:multikart_admin/extensions/text_extension.dart';
import '../../../config.dart';

class ProductVariant extends StatelessWidget {
  const ProductVariant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VariantController>(builder: (variantCtrl) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(Insets.i10),
          width: MediaQuery.of(context).size.width,
          color: appCtrl.appTheme.greyLight25,
          child: Text(fonts.productVariant.tr)
              .fontWeight(FontWeight.bold)
              .fontSize(FontSizes.f16).textColor(appCtrl.isTheme ? appCtrl.appTheme.gray:appCtrl.appTheme.blackColor1),
        ),
        const VSpace(Sizes.s20),
        Row(children: [
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () => {
                variantCtrl.productIdType = "productVariant1",
                variantCtrl.saveBanner("ProductDetailsVariant", 1),
                variantCtrl.update()
              },
              child: Container(
                width: (MediaQuery.of(context).size.width / 4).clamp(100, 200),
                decoration: variantCtrl.productIdType == "productVariant1"
                    ? BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r20)),
                        border: Border.all(
                            color: appCtrl.appTheme.primary.withOpacity(0.8),
                            width: 2))
                    : BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r20)),
                        border: Border.all(
                            color: appCtrl.appTheme.gray.withOpacity(0.8),
                            width: 2)),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image(
                      image: AssetImage(ImageAssets().productDetails1),
                      height: Sizes.s300,
                    ).paddingAll(Insets.i20),
                    RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        value: "productVariant1",
                        groupValue: variantCtrl.productIdType,
                        activeColor: appCtrl.appTheme.primary,
                        onChanged: (value) {
                          variantCtrl.productIdType = value!;
                          variantCtrl.saveBanner("ProductDetailsVariant", 1);
                          variantCtrl.update();
                        }),
                  ],
                ),
              ),
            ),
          ),
          const HSpace(Sizes.s60),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () => {
                variantCtrl.productIdType = "productVariant2",
                variantCtrl.saveBanner("ProductDetailsVariant", 2),
                variantCtrl.update()
              },
              child: Container(
                width: (MediaQuery.of(context).size.width / 4).clamp(100, 200),
                decoration: variantCtrl.productIdType == "productVariant2"
                    ? BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r20)),
                        border: Border.all(
                            color: appCtrl.appTheme.primary.withOpacity(0.8),
                            width: 2))
                    : BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r20)),
                        border: Border.all(
                            color: appCtrl.appTheme.gray.withOpacity(0.8),
                            width: 2)),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image(
                      image: AssetImage(ImageAssets().productDetails2),
                      height: Sizes.s300,
                    ).paddingAll(Insets.i20),
                    RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        value: "productVariant2",
                        groupValue: variantCtrl.productIdType,
                        activeColor: appCtrl.appTheme.primary,
                        onChanged: (value) {
                          variantCtrl.productIdType = value!;
                          variantCtrl.saveBanner("ProductDetailsVariant", 2);
                          variantCtrl.update();
                        }),
                  ],
                ),
              ),
            ),
          ),
          const HSpace(Sizes.s60),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () => {
                variantCtrl.productIdType = "productVariant3",
                variantCtrl.saveBanner("ProductDetailsVariant", 3),
                variantCtrl.update()
              },
              child: Container(
                width: (MediaQuery.of(context).size.width / 4).clamp(100, 200),
                decoration: variantCtrl.productIdType == "productVariant3"
                    ? BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r20)),
                        border: Border.all(
                            color: appCtrl.appTheme.primary.withOpacity(0.8),
                            width: 2))
                    : BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r20)),
                        border: Border.all(
                            color: appCtrl.appTheme.gray.withOpacity(0.8),
                            width: 2)),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image(
                      image: AssetImage(ImageAssets().productDetails3),
                      height: Sizes.s300,
                    ).paddingAll(Insets.i20),
                    RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        value: "productVariant3",
                        groupValue: variantCtrl.productIdType,
                        activeColor: appCtrl.appTheme.primary,
                        onChanged: (value) {
                          variantCtrl.productIdType = value!;
                          variantCtrl.saveBanner("ProductDetailsVariant", 3);
                          variantCtrl.update();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ])
      ]);
    });
  }
}
