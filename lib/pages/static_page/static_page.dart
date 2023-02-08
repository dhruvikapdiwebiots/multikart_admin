

import '../../config.dart';

class StaticPage extends StatelessWidget {
  final staticCtrl = Get.put(StaticController());

  StaticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaticController>(builder: (_) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Card(
              elevation: 5,
              child: Responsive.isDesktop(context)
                  ? const StaticDesktopLayout()
                  : const StaticMobileLayout().paddingSymmetric(
                      horizontal: Insets.i15, vertical: Insets.i20)),
          if (staticCtrl.isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
        ],
      );
    });
  }
}
