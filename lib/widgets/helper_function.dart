import 'dart:async';

import 'package:flash/flash.dart';
import 'package:multikart_admin/widgets/icon_creation.dart';

import '../config.dart';

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
imagePickerOption({StateSetter? setState,GestureTapCallback? cameraTap, galleryTap}) {
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
                        onTap:cameraTap),
                    IconCreation(
                        icons: Icons.image,
                        color: appCtrl.isTheme
                            ? appCtrl.appTheme.white
                            : appCtrl.appTheme.primary,
                        text: "gallery",
                        onTap: galleryTap),
                  ])
            ]));
      });
}

//alert
showAlert({title,context})async{
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    persistent: false,
    builder: (_, controller) {
      return Flash(
        controller: controller,
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 1.2,
            top: Insets.i50),
        backgroundColor: appCtrl.appTheme.blackColor,
        brightness: Brightness.light,
        boxShadows: const [BoxShadow(blurRadius: 4)],
        barrierBlur: 0.0,
        barrierColor: Colors.transparent,
        barrierDismissible: true,
        behavior: FlashBehavior.floating,
        borderWidth: 1,
        position: FlashPosition.top,
        child: FlashBar(
            content: Text(title.toString().tr,
                textAlign: TextAlign.center,
                style: AppCss.nunitoMedium14
                    .textColor(appCtrl.appTheme.white)),
            showProgressIndicator: false),
      );
    },
  );
}