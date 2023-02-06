import 'package:dotted_border/dotted_border.dart';

import '../config.dart';

class CommonDottedBorder extends StatelessWidget {
  final Widget? child;
  const CommonDottedBorder({Key? key,this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.s15, vertical: Insets.i10),
      color: appCtrl.appTheme.gray.withOpacity(.5),
      radius: const Radius.circular(AppRadius.r5),
      dashPattern: const [8, 10],
      strokeWidth: 1.5,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      child: child!,
    );
  }
}
