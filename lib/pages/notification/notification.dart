import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/responsive.dart';

import '../../config.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  File? pickImage;
  XFile? imageFile;
  Uint8List webImage = Uint8List(8);
  String idType = "";

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 5,
      child: Responsive.isDesktop(context)
          ? Column(
              children: [
                Row(children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title"),
                      const VSpace(Sizes.s10),
                      CommonTextBox(hinText: "Enter notification Title"),
                    ],
                  )),
                  const HSpace(Sizes.s15),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Content"),
                      const VSpace(Sizes.s10),
                      CommonTextBox(
                        hinText: "Enter notification content",

                      ),
                    ],
                  )),
                ]).paddingSymmetric(
                    horizontal: Insets.i15, vertical: Insets.i20),
                Row(children: [

                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Image"),
                      const VSpace(Sizes.s15),
                      pickImage == null
                          ? DottedBorder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.s15, vertical: Insets.i10),
                        color: appCtrl.appTheme.gray.withOpacity(.5),
                        radius: const Radius.circular(AppRadius.r5),
                        dashPattern: const [8, 10],
                        strokeWidth: 1.5,
                        strokeCap: StrokeCap.round,
                        borderType: BorderType.RRect,
                        child: Row(children: const [
                          Icon(Icons.image),
                          HSpace(Sizes.s10),
                          Text("Add Image")
                        ]),
                      ).inkWell(
                          onTap: () {
                            if (kIsWeb) {
                              getImage(ImageSource.gallery);
                            } else {
                              imagePickerOption();
                            }
                          })
                          : kIsWeb
                          ? DottedBorder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.s15,
                              vertical: Insets.i10),
                          color: appCtrl.appTheme.gray.withOpacity(.5),
                          radius: const Radius.circular(AppRadius.r5),
                          dashPattern: const [8, 10],
                          strokeWidth: 1.5,
                          strokeCap: StrokeCap.round,
                          borderType: BorderType.RRect,
                          child: imageFile!.name.contains("png")
                              ? Image.memory(
                            webImage,
                            fit: BoxFit.fill,
                          )
                              : SvgPicture.memory(webImage,fit: BoxFit.fill,))
                          .inkWell(
                          onTap: () => getImage(ImageSource.gallery,))
                          : DottedBorder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.s15,
                              vertical: Insets.i10),
                          color: appCtrl.appTheme.gray.withOpacity(.5),
                          radius: const Radius.circular(AppRadius.r5),
                          dashPattern: const [8, 10],
                          strokeWidth: 1.5,
                          strokeCap: StrokeCap.round,
                          borderType: BorderType.RRect,
                          child: Image.file(
                            pickImage!,
                            fit: BoxFit.fill,
                            height: Sizes.s100,
                          ))
                          .inkWell(
                          onTap: () => imagePickerOption()),
                    ],
                  )),
                  const HSpace(Sizes.s10),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Deep link Id"),
                          const VSpace(Sizes.s10),
                          CommonTextBox(hinText: "Deep Link Id"),
                        ],
                      )),
                  const HSpace(Sizes.s10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Product/ Collection Id"),
                        const VSpace(Sizes.s10),
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
                                groupValue: idType,
                                activeColor: appCtrl
                                    .appTheme.primary,
                                onChanged: (value) {
                                  setState(() {
                                    idType = value!;
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
                                groupValue: idType,
                                activeColor: appCtrl
                                    .appTheme.primary,
                                onChanged: (value) {
                                  setState(() {
                                    idType = value!;
                                  });
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ]).paddingSymmetric(
                    horizontal: Insets.i15, vertical: Insets.i20),
               
                CommonButton(
                  title: "Update",
                  width: Sizes.s100,
                  style: AppCss.nunitoblack14.textColor(appCtrl.appTheme.white),
                ).alignment(Alignment.bottomRight),
                const VSpace(Sizes.s20),
              ],
            )
          : Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title"),
                  const VSpace(Sizes.s10),
                  CommonTextBox(hinText: "Enter notification Title"),
                ],
              ),
              const VSpace(Sizes.s15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Content"),
                  const VSpace(Sizes.s10),
                  CommonTextBox(
                    hinText: "Enter notification content",
                    maxLines: 2,
                  ),
                ],
              ),
              const VSpace(Sizes.s15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Image"),
                  const VSpace(Sizes.s10),
                  pickImage == null
                      ? DottedBorder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.s15, vertical: Insets.i10),
                    color: appCtrl.appTheme.gray.withOpacity(.5),
                    radius: const Radius.circular(AppRadius.r5),
                    dashPattern: const [8, 10],
                    strokeWidth: 1.5,
                    strokeCap: StrokeCap.round,
                    borderType: BorderType.RRect,
                    child: Row(children: const [
                      Icon(Icons.image),
                      HSpace(Sizes.s10),
                      Text("Add Image")
                    ]),
                  ).inkWell(
                      onTap: () {
                        if (kIsWeb) {
                          getImage(ImageSource.gallery);
                        } else {
                          imagePickerOption();
                        }
                      })
                      : kIsWeb
                      ? DottedBorder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.s15,
                          vertical: Insets.i10),
                      color: appCtrl.appTheme.gray.withOpacity(.5),
                      radius: const Radius.circular(AppRadius.r5),
                      dashPattern: const [8, 10],
                      strokeWidth: 1.5,
                      strokeCap: StrokeCap.round,
                      borderType: BorderType.RRect,
                      child: imageFile!.name.contains("png")
                          ? Image.memory(
                        webImage,
                        fit: BoxFit.fill,
                      )
                          : SvgPicture.memory(webImage,
                          fit: BoxFit.fill))
                      .inkWell(
                      onTap: () => getImage(ImageSource.gallery,))
                      : DottedBorder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.s15,
                          vertical: Insets.i10),
                      color: appCtrl.appTheme.gray.withOpacity(.5),
                      radius: const Radius.circular(AppRadius.r5),
                      dashPattern: const [8, 10],
                      strokeWidth: 1.5,
                      strokeCap: StrokeCap.round,
                      borderType: BorderType.RRect,
                      child: Image.file(
                        pickImage!,
                        fit: BoxFit.fill,
                        height: Sizes.s100,
                      ))
                      .inkWell(
                      onTap: () => imagePickerOption()),
                ],
              ),
              const VSpace(Sizes.s15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Deep link Id"),
                  const VSpace(Sizes.s10),
                  CommonTextBox(hinText: "Deep Link Id"),
                ],
              ),
              const VSpace(Sizes.s20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product/ Collection Id"),
                  const VSpace(Sizes.s10),
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
                          groupValue: idType,
                          activeColor: appCtrl
                              .appTheme.primary,
                          onChanged: (value) {
                            setState(() {
                              idType = value!;
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
                          groupValue: idType,
                          activeColor: appCtrl
                              .appTheme.primary,
                          onChanged: (value) {
                            setState(() {
                              idType = value!;
                            });
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
              const VSpace(Sizes.s20),
              CommonButton(
                title: "Update",
                width: Sizes.s100,
                style: AppCss.nunitoblack14.textColor(appCtrl.appTheme.white),
              ).alignment(Alignment.bottomRight)
            ]).paddingSymmetric(horizontal: Insets.i15, vertical: Insets.i20),
    );
  }

// GET IMAGE FROM GALLERY
  Future getImage(source) async {
    final ImagePicker picker = ImagePicker();
    imageFile = (await picker.pickImage(source: source))!;
    if (kDebugMode) {
      print("imageFile : $imageFile");

      var image = await imageFile!.readAsBytes();
      webImage = image;
      pickImage = File(imageFile!.path);
      setState(() {});
      print("pickImage : $pickImage");
      print("webImage : $webImage");
    }
  }

  //image picker option
  imagePickerOption() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.vertical(top: Radius.circular(AppRadius.r25)),
        ),
        builder: (BuildContext context) {
          // return your layout
          return Container(
            padding: const EdgeInsets.all(12),
            height: Sizes.s150,
            color: appCtrl.appTheme.whiteColor,
            alignment: Alignment.bottomCenter,
            child: Column(children: [
              const VSpace(Sizes.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconCreation(
                      icons: Icons.camera,
                      color: appCtrl.isTheme
                          ? appCtrl.appTheme.white
                          : appCtrl.appTheme.primary,
                      text: "camera",
                      onTap: () {
                        getImage(ImageSource.camera);
                        Get.back();
                      }),
                  IconCreation(
                      icons: Icons.image,
                      color: appCtrl.isTheme
                          ? appCtrl.appTheme.white
                          : appCtrl.appTheme.primary,
                      text: "gallery",
                      onTap: () {
                        getImage(ImageSource.gallery);
                        Get.back();
                      }),
                ],
              ),
            ]),
          );
        });
  }
}


class IconCreation extends StatelessWidget {
  final IconData? icons;
  final Color? color;
  final String? text;
  final GestureTapCallback? onTap;

  const IconCreation({Key? key, this.text, this.color, this.icons, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: AppRadius.r30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: Sizes.s30,
              color: appCtrl.appTheme.whiteColor,
            ),
          ),
          const VSpace(Sizes.s8),
          Text(
            text!,
            style: AppCss.nunitoblack14.textColor(appCtrl.appTheme.blackColor),
          )
        ],
      ),
    );
  }
}