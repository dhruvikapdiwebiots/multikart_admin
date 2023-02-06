import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config.dart';

class BannerImageLayout extends StatelessWidget {
  final StateSetter? setState;

  const BannerImageLayout({Key? key, this.setState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (bannerCtrl) {
      return Stack(alignment: Alignment.centerLeft, children: [
        DragDropLayout(
            onCreated: (ctrl) => bannerCtrl.controller1 = ctrl,
            onDrop: (ev) async {
              log('Zone 1 drop: ${ev.name}');
              bannerCtrl.imageName = ev.name;
              bannerCtrl.update();
              final bytes = await bannerCtrl.controller1!.getFileData(ev);
              bannerCtrl.getImage(dropImage: bytes);
            }),
        bannerCtrl.pickImage == null
            ? const ImagePickUp().inkWell(onTap: () => bannerCtrl.onImagePickUp(setState))
            : kIsWeb
                ? CommonDottedBorder(
                        child:
                            Image.memory(bannerCtrl.webImage, fit: BoxFit.fill))
                    .inkWell(
                        onTap: () =>
                            bannerCtrl.getImage(source: ImageSource.gallery))
                : CommonDottedBorder(
                        child: Image.file(bannerCtrl.pickImage!,
                            fit: BoxFit.fill, height: Sizes.s100))
                    .inkWell(
                        onTap: () => imagePickerOption(
                            setState: setState,
                            cameraTap: () {
                              bannerCtrl.getImage(
                                  source: ImageSource.camera,
                                  setState: setState);
                              Get.back();
                            },
                            galleryTap: () {
                              bannerCtrl.getImage(
                                  source: ImageSource.gallery,
                                  setState: setState);
                              Get.back();
                            }))
      ])
          .height(bannerCtrl.isUploadSize ? Sizes.s40 : Sizes.s80)
          .paddingSymmetric(horizontal: Insets.i15);
    });
  }
}
