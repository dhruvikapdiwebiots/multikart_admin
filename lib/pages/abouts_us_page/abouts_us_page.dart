import '../../config.dart';

class AboutUsPage extends StatelessWidget {
  final staticCtrl = Get.put(StaticController());

  AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaticController>(builder: (_) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Card(
              elevation: 3,
              shadowColor: appCtrl.appTheme.blackColor,
              color: appCtrl.appTheme.whiteColor,
              child: Responsive.isDesktop(context)
                  ? const AboutUsDesktopLayout()
                  : const AboutUsMobileLayout().paddingSymmetric(
                      horizontal: Insets.i15, vertical: Insets.i20)),
          if (staticCtrl.isLoading)
            const Center(child: CircularProgressIndicator())
        ],
      );
    });
  }
}
