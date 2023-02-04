import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/controllers/pages_controller/notification_controller.dart';

import '../../../config.dart';

class NotificationImage extends StatelessWidget {
  const NotificationImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (notificationCtrl) {
        return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(fonts.image.tr),
            const VSpace(Sizes.s15),
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
                    horizontal: Sizes.s15,
                    vertical: Insets.i10),
                color:
                appCtrl.appTheme.gray.withOpacity(.5),
                radius:
                const Radius.circular(AppRadius.r5),
                dashPattern: const [8, 10],
                strokeWidth: 1.5,
                strokeCap: StrokeCap.round,
                borderType: BorderType.RRect,
                child: notificationCtrl.imageFile!.name.contains("png")
                    ? Image.memory(
                  notificationCtrl.webImage,
                  fit: BoxFit.fill,
                )
                    : SvgPicture.memory(
                  notificationCtrl. webImage,
                  fit: BoxFit.fill,
                ))
                .inkWell(
                onTap: () => notificationCtrl.getImage(
                  ImageSource.gallery,
                ))
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
                  notificationCtrl.pickImage!,
                  fit: BoxFit.fill,
                  height: Sizes.s100,
                )).inkWell(onTap: () => notificationCtrl.imagePickerOption()),
          ],
        );
      }
    );
  }
}
