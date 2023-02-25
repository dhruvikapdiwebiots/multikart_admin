
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config.dart';

class MobileDrawerList extends StatelessWidget {
  final bool? value;

  const MobileDrawerList({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return GetBuilder<IndexLayoutController>(builder: (indexCtrl) {
      return Scrollbar(
        controller: scrollController,
        child: Column(children: [
          ...indexCtrl.sidebarMenuConfigs.asMap().entries.map<Widget>((menu) {
            if (menu.value.children.isEmpty) {
              return MouseRegion(
                onHover: (val) {
                  indexCtrl.isHover = true;
                  indexCtrl.isSelectedHover = menu.key;
                  indexCtrl.update();
                },
                onExit: (exit) {
                  indexCtrl.isHover = false;
                  indexCtrl.update();

                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 0.0,
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    leading: SvgPicture.asset(
                      menu.value.icon,
                      color: appCtrl.appTheme.white,
                      height: Sizes.s20,
                    ),
                    onTap: () => indexCtrl.drawerTap(
                      menu.key,
                      context,
                      value: menu.value,
                    ),
                    selected: indexCtrl.selectedIndex == menu.key,
                    textColor: appCtrl.appTheme.white,
                    selectedColor: appCtrl.appTheme.white,
                    hoverColor: appCtrl.appTheme.white.withOpacity(.2),
                  ).decorated(
                      border: Border(
                          left: BorderSide(
                              width: 5,
                              color: indexCtrl.selectedIndex == menu.key
                                  ? appCtrl.appTheme.primary
                                  : indexCtrl.isHover &&
                                  indexCtrl.isSelectedHover == menu.key
                                  ? appCtrl.appTheme.primary
                                  : appCtrl.appTheme.bgColor))),
                ),
              );
            } else {
              return Card(
                color: appCtrl.appTheme.bgColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.r8)),
                elevation: 0.0,
                margin: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                child: ExpansionTile(
                  key: UniqueKey(),
                  textColor: appCtrl.appTheme.white,
                  collapsedTextColor: appCtrl.appTheme.white,

                  iconColor: appCtrl.appTheme.white,
                  collapsedIconColor: appCtrl.appTheme.white,
                  backgroundColor: appCtrl.appTheme.bgColor,
                  childrenPadding:
                  const EdgeInsets.symmetric(horizontal: Insets.i15),
                  leading:SvgPicture.asset(
                    menu.value.icon,
                    height: Sizes.s20,
                    color: appCtrl.appTheme.white,
                  ),
                  title: Container(width: Sizes.s2,),
                  children: menu.value.children
                      .asMap()
                      .entries
                      .map<Widget>((childMenu) {
                    return Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.r8)),
                      elevation: 0.0,
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: Insets.i15),
                        title: SvgPicture.asset(
                          childMenu.value.icon,
                          color: appCtrl.appTheme.white,
                          height: Sizes.s20,
                        ),
                        onTap: () {
                          indexCtrl.subSelectIndex = childMenu.key;
                          indexCtrl.update();
                        },
                        selected: indexCtrl.subSelectIndex == childMenu.key,
                        selectedTileColor: appCtrl.appTheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppRadius.r8)),
                        textColor: appCtrl.appTheme.white,
                        hoverColor: appCtrl.appTheme.white.withOpacity(.2),
                      ).decorated(
                          border: Border(
                              left: BorderSide(
                                  width: 5,
                                  color: indexCtrl.selectedIndex == menu.key
                                      ? appCtrl.appTheme.primary
                                      : appCtrl.appTheme.bgColor))),
                    );
                  }).toList(growable: false),
                ).decorated(
                    border: Border(
                        left: BorderSide(
                            width: 5,
                            color: indexCtrl.selectedIndex == menu.key
                                ? appCtrl.appTheme.primary
                                : indexCtrl.isHover &&
                                indexCtrl.isSelectedHover == menu.key
                                ? appCtrl.appTheme.primary
                                : appCtrl.appTheme.bgColor))),
              ).decorated(
                  border: Border(
                      left: BorderSide(
                          width: 5,
                          color: indexCtrl.selectedIndex == menu.key
                              ? appCtrl.appTheme.primary
                              : indexCtrl.isHover &&
                              indexCtrl.isSelectedHover == menu.key
                              ? appCtrl.appTheme.primary
                              : appCtrl.appTheme.bgColor)));
            }
          }).toList(growable: false)
        ]),
      );
    });
  }
}
