import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/theme/index.dart';
import '../../../../config.dart';

class DarkModeLayout extends StatelessWidget {
  const DarkModeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  IntrinsicHeight(
        child:
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SvgPicture.asset(!appCtrl.isTheme ? svgAssets.moon : svgAssets.sun,
              height: Sizes.s15),
          const HSpace(Sizes.s10),
          Text(appCtrl.isTheme ? fonts.lightMode.tr : fonts.darkMode.tr,
              style: AppCss.nunitoSemiBold14
                  .textColor(appCtrl.appTheme.blackColor))
        ]).inkWell(onTap: ()async{
          appCtrl.isTheme = !appCtrl.isTheme;

          appCtrl.update();
          ThemeService().switchTheme(appCtrl.isTheme);
          await appCtrl.storage
              .write(session.isDarkMode, appCtrl.isTheme);
        }));
  }
}
