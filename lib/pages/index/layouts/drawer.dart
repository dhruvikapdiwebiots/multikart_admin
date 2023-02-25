

import '../../../config.dart';

class IndexDrawer extends StatelessWidget {
  const IndexDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexLayoutController>(builder: (indexCtrl) {
      return Visibility(
          visible: MediaQuery.of(context).size.width <= 992,
          child: ValueListenableBuilder<bool>(
              valueListenable: indexCtrl.isOpen,
              builder: (context, value, child) {
                return MouseRegion(
                  onHover: (val) {
                    indexCtrl.isHover = true;
                    indexCtrl.update();
                  },
                  onExit: (exit) {
                    indexCtrl.isHover = false;
                    indexCtrl.update();
                  },
                  onEnter: (enter) {
                    indexCtrl.isHover = true;
                    indexCtrl.update();
                  },
                  child: Drawer(
                      backgroundColor: appCtrl.appTheme.bgColor,
                      elevation: 2,
                      child: ListView(children: [
                        Image.asset(imageAssets.logo2, height: Sizes.s100)
                            .backgroundColor(appCtrl.appTheme.bgColor),
                        const VSpace(Sizes.s20),
                         DrawerList(value:value)
                      ])),
                );
              }));
    });
  }
}
