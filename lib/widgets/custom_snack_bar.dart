import '../config.dart';

class CustomSnackBar extends StatelessWidget {
  final bool isAlert,isStaticPage;
final String? text;
  const CustomSnackBar({Key? key, this.isAlert = false, this.isStaticPage = false,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isAlert ? Sizes.s42 : 0,
      width:  isAlert ? Sizes.s200 :0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutCirc,
      child: FittedBox(
        child: Container(
          height: Sizes.s50,
          width:  isAlert ? isStaticPage ?Sizes.s300 : Sizes.s200 :0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: appCtrl.appTheme.blackColor,
              borderRadius: BorderRadius.circular(AppRadius.r5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.cancel,
                color: isAlert
                    ? appCtrl.appTheme.whiteColor
                    : appCtrl.appTheme.transparentColor,
                size: Sizes.s15
              ),
              const HSpace(Sizes.s8),
              Text(isStaticPage ?fonts.modification.tr : fonts.svgNotAllowed.tr,
                  style:text != null ?  AppCss.nunitoMedium16
                      .textColor(appCtrl.appTheme.whiteColor)
                      .textDecoration(TextDecoration.none):  AppCss.nunitoMedium14
                      .textColor(appCtrl.appTheme.whiteColor)
                      .textDecoration(TextDecoration.none)),
            ],
          ),
        ),
      ),
    );
  }
}
