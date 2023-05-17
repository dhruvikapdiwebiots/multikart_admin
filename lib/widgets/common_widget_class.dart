import '../config.dart';

class CommonWidgetClass {
  //common title text
  Widget commonTitleText(title) => Column(
        children: [
          Text(
            title.toString().tr.toUpperCase(),
            style: AppCss.nunitoMedium16.textColor(appCtrl.isTheme ?appCtrl.appTheme.white : appCtrl.appTheme.secondary),
          ),
        ],
      ).paddingSymmetric(vertical: Insets.i20);

  //common value text
  Widget commonValueText(value, {isImage = false}) => Column(
        children: [
          isImage
              ? value != null
                  ? Image.network(value,height: Sizes.s50,)
                  : Text("NO IMAGE UPLOADED",
                      style: AppCss.nunitoRegular14
                          .textColor( appCtrl.appTheme.blackColor))
              : Text(
                  value,
                  style: AppCss.nunitoRegular14
                      .textColor( appCtrl.appTheme.blackColor),
                )
        ],
      );
}
