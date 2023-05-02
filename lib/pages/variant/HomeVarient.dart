import 'package:multikart_admin/extensions/text_extension.dart';

import '../../../config.dart';

class HomeVariant extends StatelessWidget {
  const HomeVariant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (bannerCtrl) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(Insets.i10),
          width: MediaQuery.of(context).size.width,
          color: appCtrl.appTheme.greyLight25,
          child: Text(fonts.homeVariant.tr)
              .fontWeight(FontWeight.bold)
              .fontSize(FontSizes.f16),
        ),
        const VSpace(Sizes.s10),
        Column(children: [
          RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(fonts.homeVariant1.tr).fontSize(FontSizes.f15),
              value: "homeVariant1",
              dense: true,
              visualDensity: const VisualDensity(horizontal: 0),
              groupValue: bannerCtrl.idType,
              activeColor: appCtrl.appTheme.primary,
              onChanged: (value) {
                bannerCtrl.idType = value!;
                bannerCtrl.update();
              }),
          RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(fonts.homeVariant2.tr).fontSize(FontSizes.f15),
              value: "homeVariant2",
              dense: true,
              visualDensity: const VisualDensity(horizontal: 0),
              groupValue: bannerCtrl.idType,
              activeColor: appCtrl.appTheme.primary,
              onChanged: (value) {
                bannerCtrl.idType = value!;
                bannerCtrl.update();
              }),
          RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(fonts.homeVariant3.tr).fontSize(FontSizes.f15),
              dense: true,
              visualDensity: const VisualDensity(horizontal: 0),
              value: "homeVariant3",
              groupValue: bannerCtrl.idType,
              activeColor: appCtrl.appTheme.primary,
              onChanged: (value) {
                bannerCtrl.idType = value!;
                bannerCtrl.update();
              })
        ])
      ]);
    });
  }
}
