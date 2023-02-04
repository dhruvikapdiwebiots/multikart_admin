import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/controllers/pages_controller/notification_controller.dart';

import '../../../config.dart';

class NotificationImage extends StatelessWidget {
  const NotificationImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (notificationCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fonts.image.tr),
          const VSpace(Sizes.s15),
          Stack(
            alignment: Alignment.center,
            children: [
              Builder(
                builder: (context) => DropzoneView(
                  operation: DragOperation.copy,
                  cursor: CursorType.grab,
                  onCreated: (ctrl) => notificationCtrl.controller1 = ctrl,
                  onLoaded: () => print('Zone 1 loaded'),
                  onError: (ev) => print('Zone 1 error: $ev'),
                  onHover: () {
                    print('Zone 1 hovered');
                  },
                  onLeave: () {
                    print('Zone 1 left');
                  },
                  onDrop: (ev) async {
                    print('Zone 1 drop: ${ev}');
                    // notificationCtrl.dragImage(ev);
                    final bytes =
                        await notificationCtrl.controller1!.getFileData(ev);
                    print(bytes.sublist(0, 20));

                   
                  },
                  onDropMultiple: (ev) async {
                    print('Zone 1 drop multiple: $ev');
                  },
                ),
              ),
              notificationCtrl.pickImage == null
                  ? DottedBorder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.s15, vertical: Insets.i10),
                      color: appCtrl.appTheme.gray.withOpacity(.5),
                      radius: const Radius.circular(AppRadius.r5),
                      dashPattern: const [8, 10],
                      strokeWidth: 1.5,
                      strokeCap: StrokeCap.round,
                      borderType: BorderType.RRect,
                      child: Row(children: [
                        const Icon(Icons.image),
                        const HSpace(Sizes.s10),
                        Text(fonts.addImage.tr)
                      ]),
                    ).inkWell(onTap: () {
                      if (kIsWeb) {
                        notificationCtrl.getImage(ImageSource.gallery);
                      } else {
                        notificationCtrl.imagePickerOption();
                      }
                    })
                  : kIsWeb
                      ? DottedBorder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.s15, vertical: Insets.i10),
                              color: appCtrl.appTheme.gray.withOpacity(.5),
                              radius: const Radius.circular(AppRadius.r5),
                              dashPattern: const [8, 10],
                              strokeWidth: 1.5,
                              strokeCap: StrokeCap.round,
                              borderType: BorderType.RRect,
                              child: notificationCtrl.imageFile!.name
                                      .contains("png")
                                  ? Image.memory(
                                      notificationCtrl.webImage,
                                      fit: BoxFit.fill,
                                    )
                                  : SvgPicture.memory(
                                      notificationCtrl.webImage,
                                      fit: BoxFit.fill,
                                    ))
                          .inkWell(
                              onTap: () => notificationCtrl.getImage(
                                    ImageSource.gallery,
                                  ))
                      : DottedBorder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.s15, vertical: Insets.i10),
                              color: appCtrl.appTheme.gray.withOpacity(.5),
                              radius: const Radius.circular(AppRadius.r5),
                              dashPattern: const [8, 10],
                              strokeWidth: 1.5,
                              strokeCap: StrokeCap.round,
                              borderType: BorderType.RRect,
                              child: Image.file(
                                notificationCtrl.pickImage!,
                                fit: BoxFit.fill,
                                height: Sizes.s100,
                              ))
                          .inkWell(
                              onTap: () =>
                                  notificationCtrl.imagePickerOption()),
            ],
          ).height(Sizes.s50),
        ],
      );
    });
  }
}
