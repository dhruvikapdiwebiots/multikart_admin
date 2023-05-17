import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/controllers/pages_controller/onboard_controller.dart';

import '../../../config.dart';

class OnboardImage2 extends StatelessWidget {
  final StateSetter? setState;
  final String? image;

  const OnboardImage2({Key? key, this.setState, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(builder: (onboardCtrl) {
      return Stack(alignment: Alignment.centerLeft, children: [
        DragDropLayout(
            onCreated: (ctrl) => onboardCtrl.controller2 = ctrl,
            onDrop: (ev) async {
              log('Zone 1 drop: ${ev.name}');
              onboardCtrl.onboardImageName2 = ev.name;
              onboardCtrl.update();
              final bytes = await onboardCtrl.controller2!.getFileData(ev);
              onboardCtrl.getImage(dropImage: bytes, title: "image2");
            }),
        image!.isNotEmpty &&
                image != "" &&
                onboardCtrl.onboardPickImage2 != null &&
                onboardCtrl.onboardWebImage2.isNotEmpty
            ? CommonDottedBorder(
                    child: Image.memory(onboardCtrl.onboardWebImage2,
                        fit: BoxFit.fill))
                .inkWell(
                    onTap: () => onboardCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "image2"))
            : image!.isNotEmpty
                ? CommonDottedBorder(
                    child: Image.network(
                    image!,
                  )).inkWell(
                    onTap: () => onboardCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "image2"))
                : onboardCtrl.onboardPickImage2 == null
                    ? const ImagePickUp().inkWell(
                        onTap: () => onboardCtrl.onImagePickUp(
                            setState, context, "image2"))
                    : CommonDottedBorder(
                            child: Image.memory(onboardCtrl.onboardWebImage2,
                                fit: BoxFit.fill))
                        .inkWell(
                            onTap: () => onboardCtrl.getImage(
                                source: ImageSource.gallery,
                                context: context,
                                title: "image2"))
      ]).height(onboardCtrl.isOnboardUploadFile2 ? Sizes.s40 : Sizes.s50);
    });
  }
}
