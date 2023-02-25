import '../../config.dart';

class AboutUsPage extends StatelessWidget {
  final staticCtrl = Get.put(StaticController());

  AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaticController>(builder: (_) {
      return SingleChildScrollView(
        child:  Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Card(
                        elevation: 2,
                        shadowColor: appCtrl.appTheme.blackColor,
                        color: appCtrl.appTheme.whiteColor,
                        child: Responsive.isDesktop(context)
                            ? const AboutUsDesktopLayout()
                            : const AboutUsMobileLayout().paddingSymmetric(
                            horizontal: Insets.i15, vertical: Insets.i20)),
                    if (staticCtrl.isLoading)
                      const Center(child: CircularProgressIndicator())

                  ],
                ),
                CustomSnackBar(isAlert: staticCtrl.isAlert,text: fonts.modification.tr,)
              ],
            ),
          ]
        ),
      );
    });
  }
}
