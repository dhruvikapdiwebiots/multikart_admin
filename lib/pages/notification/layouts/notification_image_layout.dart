import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config.dart';

class NotificationImageLayout extends StatelessWidget {
  const NotificationImageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (notificationCtrl) {
        return Stack(alignment: Alignment.centerLeft, children: [
          DragDropLayout(
              onCreated: (ctrl) => notificationCtrl.controller1 = ctrl,
              onDrop: (ev) async {
                log('Zone 1 drop: ${ev.name}');
                final bytes =
                await notificationCtrl.controller1!.getFileData(ev);
                notificationCtrl.getImage(dropImage: bytes);
              }),
          notificationCtrl.pickImage == null
              ? const ImagePickUp().inkWell(onTap: () {
            if (kIsWeb) {
              notificationCtrl.getImage(source: ImageSource.gallery);
            } else {
              imagePickerOption(cameraTap: () {
                notificationCtrl.getImage(source: ImageSource.camera);
                Get.back();
              }, galleryTap: () {
                notificationCtrl.getImage(
                    source: ImageSource.gallery);
                Get.back();
              });
            }
          })
              : kIsWeb
              ? CommonDottedBorder(
              child: Image.memory(notificationCtrl.webImage,
                  fit: BoxFit.fill))
              .inkWell(
              onTap: () => notificationCtrl.getImage(
                  source: ImageSource.gallery))
              : CommonDottedBorder(
              child: Image.file(notificationCtrl.pickImage!,
                  fit: BoxFit.fill, height: Sizes.s100))
              .inkWell(
              onTap: () => imagePickerOption(cameraTap: () {
                notificationCtrl.getImage(
                    source: ImageSource.camera);
                Get.back();
              }, galleryTap: () {
                notificationCtrl.getImage(
                    source: ImageSource.gallery);
                Get.back();
              }))
        ]).height(notificationCtrl.isUploadSize ? Sizes.s40 : Sizes.s50);
      }
    );
  }
}
