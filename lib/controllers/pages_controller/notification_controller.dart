import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/config.dart';

import '../../widgets/icon_creation.dart';

class NotificationController extends GetxController {
  File? pickImage;
  XFile? imageFile;
  bool isUploadSize = false;
  Uint8List uploadWebImage = Uint8List(8);
  Uint8List webImage = Uint8List(8);
  String idType = "";
  String imageName = "";
  late DropzoneViewController? controller1;

// GET IMAGE FROM GALLERY
  Future getImage( {source,dropImage}) async {

    if (kDebugMode) {
      if(dropImage != null){
        if (imageName.contains("png") ||
            imageName.contains("jpg") ||
            imageName.contains("jpeg")) {
          var image = dropImage;
          uploadWebImage = image;
          log("info 1: $image");

          Image image1 = Image.memory(uploadWebImage);

          ImageInfo info = await getImageInfo(image1);
          log("info : ${info.image.width}");
          log("info : ${info.image.width}");
          if (info.image.width > 300 && info.image.height > 50) {
            webImage = uploadWebImage;
            pickImage = File("a");
            isUploadSize = false;
          } else {
            isUploadSize = true;
          }
        }else{
          ScaffoldMessenger.of(Get.context!)
              .showSnackBar(const SnackBar(content: Text("No Svg Allow")));
        }
        update();
      }else {
        final ImagePicker picker = ImagePicker();
        imageFile = (await picker.pickImage(source: source))!;

        if (imageFile!.name.contains("png") ||
            imageFile!.name.contains("jpg") ||
            imageFile!.name.contains("jpeg")) {
          var image = await imageFile!.readAsBytes();
          uploadWebImage = image;
          log("info 1: $image");

          Image image1 = Image.memory(uploadWebImage);

          ImageInfo info = await getImageInfo(image1);
          log("info : ${info.image.width}");
          log("info : ${info.image.width}");
          if (info.image.width > 300 && info.image.height > 50) {
            webImage = uploadWebImage;
            pickImage = File(imageFile!.path);
            isUploadSize = false;
          } else {
            isUploadSize = true;
          }

          update();
        } else {
          ScaffoldMessenger.of(Get.context!)
              .showSnackBar(const SnackBar(content: Text("No Svg Allow")));
        }
      }
    }
  }

  Future<ImageInfo> getImageInfo(Image img) async {
    final c = Completer<ImageInfo>();
    img.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo i, bool _) {
      c.complete(i);
    }));
    return c.future;
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
                          getImage(source: ImageSource.camera);
                          Get.back();
                        }),
                    IconCreation(
                        icons: Icons.image,
                        color: appCtrl.isTheme
                            ? appCtrl.appTheme.white
                            : appCtrl.appTheme.primary,
                        text: "gallery",
                        onTap: () {
                          getImage(source: ImageSource.gallery);
                          Get.back();
                        }),
                  ])
            ]),
          );
        });
  }
}
