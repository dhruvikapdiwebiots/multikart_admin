import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/controllers/pages_controller/about_app_controller.dart';

import '../../../config.dart';

class DrawerLogo extends StatelessWidget {
  final StateSetter? setState;
  final String? image;
  const DrawerLogo({Key? key, this.setState, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutAppController>(builder: (aboutUsCtrl) {
      log("aboutUsCtrl.pickImage : ${image!.isNotEmpty || aboutUsCtrl.drawerPickImage != null || aboutUsCtrl.drawerWebImage.isNotEmpty}");
      return Stack(children: [
        DragDropLayout(
            onCreated: (ctrl) => aboutUsCtrl.controller3 = ctrl,
            onDrop: (ev) async {
              log('Zone 1 drop: ${ev.name}');
              aboutUsCtrl.drawerImageName = ev.name;
              aboutUsCtrl.update();
              final bytes = await aboutUsCtrl.controller3!.getFileData(ev);
              aboutUsCtrl.getImage(dropImage: bytes, title: "drawerLogo");
            }),
        image!.isNotEmpty &&
                aboutUsCtrl.drawerPickImage != null &&
                aboutUsCtrl.drawerWebImage.isNotEmpty
            ? CommonDottedBorder(child: Image.memory(aboutUsCtrl.drawerWebImage, fit: BoxFit.fill))
                .inkWell(
                    onTap: () => aboutUsCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "drawerLogo"))
            : image!.isNotEmpty
                ? CommonDottedBorder(child: Image.network(image!)).inkWell(
                    onTap: () => aboutUsCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "drawerLogo"))
                : aboutUsCtrl.drawerPickImage == null
                    ? const ImagePickUp().inkWell(
                        onTap: () => aboutUsCtrl.onImagePickUp(
                            setState, context, "drawerLogo"))
                    : CommonDottedBorder(
                            child: Image.memory(aboutUsCtrl.drawerWebImage,
                                fit: BoxFit.fill))
                        .inkWell(
                            onTap: () => aboutUsCtrl.getImage(
                                source: ImageSource.gallery,
                                context: context,
                                title: "drawerLogo"))
      ]).height(aboutUsCtrl.isDrawerUploadFile ? Sizes.s40 : Sizes.s50);
    });
  }
}
