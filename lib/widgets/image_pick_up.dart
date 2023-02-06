import '../config.dart';

class ImagePickUp extends StatelessWidget {
  const ImagePickUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonDottedBorder(
        child: Row(children: [
          const Icon(Icons.image),
          const HSpace(Sizes.s10),
          Text(fonts.addImage.tr)
        ]));
  }
}
