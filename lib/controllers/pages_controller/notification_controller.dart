import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/config.dart';

import '../../widgets/icon_creation.dart';

class NotificationController extends GetxController {
  File? pickImage;
  XFile? imageFile;
  Uint8List webImage = Uint8List(8);
  String idType = "";

// GET IMAGE FROM GALLERY
  Future getImage(source) async {
    final ImagePicker picker = ImagePicker();
    imageFile = (await picker.pickImage(source: source))!;
    if (kDebugMode) {
      print("imageFile : $imageFile");

      var image = await imageFile!.readAsBytes();
      webImage = image;
      pickImage = File(imageFile!.path);
      update();
      print("pickImage : $pickImage");
      print("webImage : $webImage");
    }
  }

  //image picker option
  imagePickerOption() {
    showModalBottomSheet(
        context: Get.context!,
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
                  ])
            ]),
          );
        });
  }
}
