import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config.dart';
import '../../../widgets/helper_function.dart';

class AddBanner extends StatelessWidget {
  const AddBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return GetBuilder<BannerController>(builder: (bannerCtrl) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
                width: Sizes.s500,
                child: Stack(alignment: Alignment.topRight, children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: Sizes.s50,
                        width: Sizes.s500,
                        decoration: BoxDecoration(
                            color: appCtrl.appTheme.whiteColor,
                            border: Border(
                                bottom: BorderSide(
                                    color: appCtrl.appTheme.gray
                                        .withOpacity(0.3)))),
                        child: Center(
                            child: Text(fonts.addBanner.tr,
                                style: AppCss.nunitoblack20
                                    .textColor(appCtrl.appTheme.blackColor))),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextBox(hinText: fonts.name.tr),
                                const VSpace(Sizes.s15),
                                CommonTextBox(
                                    hinText: fonts.productCollectionId),
                                const VSpace(Sizes.s15),
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
                                              activeColor:
                                                  appCtrl.appTheme.primary,
                                              onChanged: (value) {
                                                setState(() {
                                                  bannerCtrl.idType = value!;
                                                });
                                              })),
                                      Expanded(
                                          child: RadioListTile(
                                              contentPadding: EdgeInsets.zero,
                                              title:  Text(fonts.collection.tr),
                                              dense: true,
                                              visualDensity:
                                                  const VisualDensity(horizontal: 0),
                                              value: "collection",
                                              groupValue: bannerCtrl.idType,
                                              activeColor:
                                                  appCtrl.appTheme.primary,
                                              onChanged: (value) {
                                                setState(() {
                                                  bannerCtrl.idType = value!;
                                                });
                                              }))
                                    ])
                              ])),
                      Stack(alignment: Alignment.centerLeft, children: [
                        DragDropLayout(
                            onCreated: (ctrl) => bannerCtrl.controller1 = ctrl,
                            onDrop: (ev) async {
                              log('Zone 1 drop: ${ev.name}');
                              bannerCtrl.imageName = ev.name;
                              bannerCtrl.update();
                              final bytes =
                                  await bannerCtrl.controller1!.getFileData(ev);
                              bannerCtrl.getImage(dropImage: bytes);
                            }),
                        bannerCtrl.pickImage == null
                            ? CommonDottedBorder(
                                child: Row(children: [
                                const Icon(Icons.image),
                                const HSpace(Sizes.s10),
                                Text(fonts.addImage.tr)
                              ])).inkWell(onTap: () {
                                if (kIsWeb) {
                                  bannerCtrl.getImage(
                                      source: ImageSource.gallery);
                                } else {
                                  imagePickerOption(setState:setState, cameraTap: () {
                                    bannerCtrl.getImage(
                                        source: ImageSource.camera,
                                        setState: setState);
                                    Get.back();
                                  }, galleryTap: () {
                                    bannerCtrl.getImage(
                                        source: ImageSource.gallery,
                                        setState: setState);
                                    Get.back();
                                  });
                                }
                              })
                            : kIsWeb
                                ? CommonDottedBorder(child: Image.memory(bannerCtrl.webImage, fit: BoxFit.fill))
                                    .inkWell(
                                        onTap: () => bannerCtrl.getImage(
                                            source: ImageSource.gallery))
                                : CommonDottedBorder(
                                        child: Image.file(bannerCtrl.pickImage!,
                                            fit: BoxFit.fill,
                                            height: Sizes.s100))
                                    .inkWell(
                                        onTap: () => imagePickerOption(setState:setState, cameraTap: () {
                                              bannerCtrl.getImage(
                                                  source: ImageSource.camera,
                                                  setState: setState);
                                              Get.back();
                                            }, galleryTap: () {
                                              bannerCtrl.getImage(
                                                  source: ImageSource.gallery,
                                                  setState: setState);
                                              Get.back();
                                            }))
                      ])
                          .height(
                              bannerCtrl.isUploadSize ? Sizes.s40 : Sizes.s80)
                          .paddingSymmetric(horizontal: Insets.i15),
                      const VSpace(Sizes.s10),
                      if (bannerCtrl.isUploadSize)
                        Column(children: [
                          const VSpace(Sizes.s5),
                          Text("Upload image more than 300p X 50px",
                              style: AppCss.nunitoMedium12
                                  .textColor(appCtrl.appTheme.redColor))
                        ]),
                      const VSpace(Sizes.s25),
                      CommonButton(
                          title: "Submit",
                          style: AppCss.nunitoblack14
                              .textColor(appCtrl.appTheme.white)),
                      const VSpace(Sizes.s15)
                    ],
                  ),
                  Positioned(
                      right: 15.0,
                      top: 15.0,
                      child: InkResponse(
                          onTap: () => Navigator.of(context).pop(),
                          child: CircleAvatar(
                              radius: 12,
                              backgroundColor: appCtrl.appTheme.primary,
                              child: Icon(Icons.close,
                                  size: 18, color: appCtrl.appTheme.white))))
                ])));
      });
    });
  }
}
