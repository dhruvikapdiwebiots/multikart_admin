import 'package:multikart_admin/common/assets/image_asset.dart';
import 'package:multikart_admin/controllers/pages_controller/variant_controller.dart';
import 'package:multikart_admin/extensions/text_extension.dart';

import '../../../config.dart';

class HomeVariant extends StatelessWidget {
  const HomeVariant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VariantController>(builder: (variantCtrl) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(Insets.i10),
          width: MediaQuery.of(context).size.width,
          color: appCtrl.appTheme.greyLight25,
          child: Text(fonts.homeVariant.tr)
              .fontWeight(FontWeight.bold)
              .fontSize(FontSizes.f16).textColor(appCtrl.isTheme ? appCtrl.appTheme.gray:appCtrl.appTheme.blackColor1),
        ),
        const VSpace(Sizes.s20),
        Row(children: [
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () => {
                variantCtrl.idType = "homeVariant1",
                variantCtrl.saveBanner("homeVariant", 1),
                variantCtrl.update()
              },
              child: Container(
                width: (MediaQuery.of(context).size.width / 4).clamp(100, 200),
                decoration: variantCtrl.idType == "homeVariant1"
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
                      image: AssetImage(ImageAssets().homeVariant1),
                      height: Sizes.s300,
                    ).paddingAll(Insets.i20),
                    RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        value: "homeVariant1",
                        groupValue: variantCtrl.idType,
                        activeColor: appCtrl.appTheme.primary,
                        onChanged: (value) {
                          variantCtrl.idType = value!;
                          variantCtrl.saveBanner("homeVariant", 1);
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
                      variantCtrl.idType = "homeVariant2",
                      variantCtrl.saveBanner("homeVariant", 2),
                      variantCtrl.update()
                    },
                child: Container(
                  width:
                      (MediaQuery.of(context).size.width / 4).clamp(100, 200),
                  decoration: variantCtrl.idType == "homeVariant2"
                      ? BoxDecoration(
                          color: appCtrl.appTheme.primary.withOpacity(0.1),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppRadius.r20)),
                          border: Border.all(
                              color: appCtrl.appTheme.primary.withOpacity(0.8),
                              width: 2))
                      : BoxDecoration(
                          color: appCtrl.appTheme.gray.withOpacity(0.1),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppRadius.r20)),
                          border: Border.all(
                              color: appCtrl.appTheme.gray.withOpacity(0.8),
                              width: 2)),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image(
                        image: AssetImage(ImageAssets().homeVariant2),
                        height: Sizes.s300,
                      ).paddingAll(Insets.i20),
                      RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          value: "homeVariant2",
                          groupValue: variantCtrl.idType,
                          activeColor: appCtrl.appTheme.primary,
                          onChanged: (value) {
                            variantCtrl.idType = value!;
                            variantCtrl.saveBanner("homeVariant", 2);
                            variantCtrl.update();
                          }),
                    ],
                  ),
                )),
          ),
          const HSpace(Sizes.s60),
          Flexible(
            flex: 1,
            child: GestureDetector(
                onTap: () => {
                      variantCtrl.idType = "homeVariant3",
                      variantCtrl.saveBanner("homeVariant", 3),
                      variantCtrl.update()
                    },
                child: Container(
                  width:
                      (MediaQuery.of(context).size.width / 4).clamp(100, 200),
                  decoration: variantCtrl.idType == "homeVariant3"
                      ? BoxDecoration(
                          color: appCtrl.appTheme.primary.withOpacity(0.1),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppRadius.r20)),
                          border: Border.all(
                              color: appCtrl.appTheme.primary.withOpacity(0.8),
                              width: 2))
                      : BoxDecoration(
                          color: appCtrl.appTheme.gray.withOpacity(0.1),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppRadius.r20)),
                          border: Border.all(
                              color: appCtrl.appTheme.gray.withOpacity(0.8),
                              width: 2)),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image(
                        image: AssetImage(ImageAssets().homeVariant3),
                        height: Sizes.s300,
                      ).paddingAll(Insets.i20),
                      RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          value: "homeVariant3",
                          groupValue: variantCtrl.idType,
                          activeColor: appCtrl.appTheme.primary,
                          onChanged: (value) {
                            variantCtrl.idType = value!;
                            variantCtrl.saveBanner("homeVariant", 3);
                            variantCtrl.update();
                          }),
                    ],
                  ),
                )),
          )
        ])
      ]);
    });
  }
}
