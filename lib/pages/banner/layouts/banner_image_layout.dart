import 'dart:developer';

import 'package:image_picker/image_picker.dart';

import '../../../config.dart';

class BannerImageLayout extends StatelessWidget {
  final StateSetter? setState;

  const BannerImageLayout({Key? key, this.setState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (bannerCtrl) {
      log("bannerCtrl.pickImage : ${bannerCtrl.imageUrl.isNotEmpty || bannerCtrl.pickImage != null  || bannerCtrl.webImage.isNotEmpty}");
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
        bannerCtrl.imageUrl.isNotEmpty && bannerCtrl.pickImage != null  && bannerCtrl.webImage.isNotEmpty
            ? CommonDottedBorder(
                    child: Image.memory(bannerCtrl.webImage, fit: BoxFit.fill))
                .inkWell(
                    onTap: () => bannerCtrl.getImage(
                        source: ImageSource.gallery, context: context))
            : bannerCtrl.imageUrl.isNotEmpty
                ? CommonDottedBorder(child: Image.network(bannerCtrl.imageUrl))
                    .inkWell(
                        onTap: () => bannerCtrl.getImage(
                            source: ImageSource.gallery, context: context))
                : bannerCtrl.pickImage == null
                    ? const ImagePickUp().inkWell(
                        onTap: () =>
                            bannerCtrl.onImagePickUp(setState, context))
                    : CommonDottedBorder(
                            child: Image.memory(bannerCtrl.webImage,
                                fit: BoxFit.fill))
                        .inkWell(
                            onTap: () => bannerCtrl.getImage(
                                source: ImageSource.gallery, context: context))
      ])
          .height(bannerCtrl.isUploadSize ? Sizes.s40 : Sizes.s50)
          .paddingSymmetric(horizontal: Insets.i15);
    });
  }
}
