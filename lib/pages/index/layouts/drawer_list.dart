
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config.dart';

class DrawerList extends StatelessWidget {
  final bool? value;

  const DrawerList({Key? key, this.value}) : super(key: key);

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
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          menu.value.icon,
                          color: appCtrl.appTheme.white,
                          height: Sizes.s20,
                        ),
                        const SizedBox(width: 16 * 0.5),
                        Text(
                          menu.value.title.tr,
                          style: AppCss.nunitoMedium16.textColor(appCtrl.appTheme.white),
                        ),
                      ],
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
                  collapsedIconColor: appCtrl.appTheme.white,
                  textColor: appCtrl.appTheme.white,
                  collapsedTextColor: appCtrl.appTheme.white,
                  iconColor: appCtrl.appTheme.white,

                  backgroundColor: appCtrl.appTheme.bgColor,
                  childrenPadding:EdgeInsets.zero,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        menu.value.icon,
                        height: Sizes.s20,
                        color: appCtrl.appTheme.white,
                      ),
                      const SizedBox(width: 16 * 0.5),
                      Text(menu.value.title.tr,   style: AppCss.nunitoMedium16.textColor(appCtrl.appTheme.white),),
                    ],
                  ),
                  children: menu.value.children
                      .asMap()
                      .entries
                      .map<Widget>((childMenu) {
                    return Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.r8)),
                      elevation: 0.0,
                      margin: const EdgeInsets.symmetric(horizontal: Insets.i20),
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        dense: true,
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: Insets.i15),
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              childMenu.value.icon,
                              color: appCtrl.appTheme.white,
                              height: Sizes.s20,
                            ),
                            const SizedBox(width: 16 * 0.5),
                            Text(
                              childMenu.value.title.tr,
                              style: AppCss.nunitoMedium16.textColor(appCtrl.appTheme.white),
                            ),
                          ],
                        ),
                        onTap: () {
                          indexCtrl.subSelectIndex = childMenu.key;
                          indexCtrl.update();

                        },
                        selected: indexCtrl.subSelectIndex == childMenu.key,
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
                  onExpansionChanged: (bool expanded) {
                  },
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
