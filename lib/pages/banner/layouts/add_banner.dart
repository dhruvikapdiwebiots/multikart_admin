import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/controllers/pages_controller/banner_controller.dart';

import '../../../config.dart';

class AddBanner extends StatelessWidget {
  const AddBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder:
        (BuildContext context, StateSetter setState) {

      return GetBuilder<BannerController>(
        builder: (bannerCtrl) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              width: Sizes.s400,
              child: Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Column(

                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: Sizes.s50,
                        width: Sizes.s400,
                        decoration: BoxDecoration(
                            color:
                            appCtrl.appTheme.whiteColor,
                            border: Border(
                                bottom: BorderSide(
                                    color: appCtrl
                                        .appTheme.gray
                                        .withOpacity(0.3)))),
                        child: const Center(
                            child: Text("Add Banner",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight:
                                    FontWeight.w700,
                                    fontSize: 20,
                                    fontStyle:
                                    FontStyle.italic,
                                    fontFamily:
                                    "Helvetica"))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            const CommonTextBox(
                              hinText: "Name",
                            ),
                            const VSpace(Sizes.s15),
                            const CommonTextBox(
                              hinText: "Product Id",
                            ),
                            const VSpace(Sizes.s15),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text("Product"),
                                    value: "product",
                                    dense: true,
                                    visualDensity: VisualDensity(horizontal: 0),
                                    groupValue:bannerCtrl.idType,
                                    activeColor: appCtrl
                                        .appTheme.primary,
                                    onChanged: (value) {
                                      setState(() {
                                        bannerCtrl.idType = value!;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text("Collection"),
                                    dense: true,
                                    visualDensity: VisualDensity(horizontal: 0),
                                    value: "collection",
                                    groupValue: bannerCtrl.idType,
                                    activeColor: appCtrl
                                        .appTheme.primary,
                                    onChanged: (value) {
                                      setState(() {
                                        bannerCtrl.idType = value!;
                                      });
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      bannerCtrl.pickImage == null
                          ? DottedBorder(
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: Sizes.s15,
                            vertical: Insets.i10),
                        color: appCtrl.appTheme.gray
                            .withOpacity(.5),
                        radius: const Radius.circular(
                            AppRadius.r5),
                        dashPattern: const [8, 10],
                        strokeWidth: 1.5,
                        strokeCap: StrokeCap.round,
                        borderType: BorderType.RRect,
                        child: Row(children: const [
                          Icon(Icons.image),
                          HSpace(Sizes.s10),
                          Text("Add Image")
                        ]),
                      )
                          .paddingSymmetric(
                          horizontal: Insets.i20)
                          .inkWell(onTap: () {
                        if (kIsWeb) {
                          bannerCtrl.getImage(ImageSource.gallery,
                              setState: setState);
                        }else{
                          bannerCtrl.imagePickerOption(setState);
                        }
                      })
                          : kIsWeb
                          ? DottedBorder(
                          padding: const EdgeInsets
                              .symmetric(
                              horizontal: Sizes.s15,
                              vertical: Insets.i10),
                          color: appCtrl.appTheme.gray
                              .withOpacity(.5),
                          radius:
                          const Radius.circular(
                              AppRadius.r5),
                          dashPattern: const [8, 10],
                          strokeWidth: 1.5,
                          strokeCap: StrokeCap.round,
                          borderType:
                          BorderType.RRect,
                          child:
                          bannerCtrl.imageFile!.name.contains("png") ?  Image.memory(bannerCtrl.webImage,fit: BoxFit.fill,) : SvgPicture.memory(bannerCtrl.webImage)).inkWell(onTap: ()=> bannerCtrl.getImage(ImageSource.gallery,setState:setState))
                          :  DottedBorder(
                          padding: const EdgeInsets
                              .symmetric(
                              horizontal: Sizes.s15,
                              vertical: Insets.i10),
                          color: appCtrl.appTheme.gray
                              .withOpacity(.5),
                          radius:
                          const Radius.circular(
                              AppRadius.r5),
                          dashPattern: const [8, 10],
                          strokeWidth: 1.5,
                          strokeCap: StrokeCap.round,
                          borderType:
                          BorderType.RRect,child: Image.file(bannerCtrl.pickImage!,fit: BoxFit.fill,height: Sizes.s100,)).inkWell(onTap: ()=>  bannerCtrl.imagePickerOption(setState)),
                      const VSpace(Sizes.s25),
                      CommonButton(
                        title: "Submit",
                        style: AppCss.nunitoblack14.textColor(
                            appCtrl.appTheme.white),
                      ),
                      const VSpace(Sizes.s15)
                    ],
                  ),
                  Positioned(
                    right: 15.0,
                    top: 15.0,
                    child: InkResponse(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor:
                        appCtrl.appTheme.primary,
                        child: Icon(
                          Icons.close,
                          size: 18,
                          color: appCtrl.appTheme.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      );
    });
  }
}
