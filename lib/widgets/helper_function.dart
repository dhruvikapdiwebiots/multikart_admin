import 'dart:async';

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
imagePickerOption(
    {StateSetter? setState, GestureTapCallback? cameraTap, galleryTap}) {
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
                        onTap: cameraTap),
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
showAlert({title, context}) async {

}

//test user not allow dialog
accessDenied(String content) {
  Get.dialog(
    AlertDialog(
      title: const Text("Alert!"),
      content: Text(content.tr),

      actions: <Widget>[
        CommonButton(
          title: "Close",
          width: Sizes.s80,
          style: AppCss.nunitoMedium16.textColor(appCtrl.appTheme.white),
          onTap: () => Get.back(),
        )
      ],
    ),
    barrierDismissible: true,
  );
}
