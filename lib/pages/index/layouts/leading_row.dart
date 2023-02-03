import '../../../config.dart';

class LeadingRow extends StatelessWidget {
  const LeadingRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (indexCtrl) {
      return Row(children: [
        ValueListenableBuilder<bool>(
            valueListenable: indexCtrl.isOpen,
            builder: (context, value, child) {
              if (Responsive.isDesktop(context) && value) {
                return InkWell(
                    onTap: () {},
                    child: Container(
                        width: Sizes.s240,
                        padding: const EdgeInsets.symmetric(horizontal: 61),
                        height: double.infinity,
                        color: appCtrl.appTheme.blackColor,
                        child: Image.asset(imageAssets.logo2)));
              }
              return InkWell(
                  onTap: () {
                    indexCtrl.scaffoldDrawerKey.currentState?.closeDrawer();
                  },
                  child: Responsive.isDesktop(context)
                      ? Container(
                          width: Sizes.s70,
                          color: appCtrl.appTheme.blackColor,
                          padding: const EdgeInsets.all(Insets.i15),
                          height: double.infinity,
                          child: Image.asset(imageAssets.logo1,
                              fit: BoxFit.contain))
                      : Container());
            }),
        MaterialButton(
            height: double.infinity,
            hoverColor: Colors.transparent,
            onPressed: () async {
              if (Responsive.isMobile(context) ||
                  Responsive.isTablet(context)) {
                if (indexCtrl.scaffoldKey.currentState!.isDrawerOpen) {
                  indexCtrl.scaffoldKey.currentState!.closeDrawer();
                } else {
                  indexCtrl.scaffoldKey.currentState!.openDrawer();
                }
              } else if (Responsive.isDesktop(context)) {
                //indexCtrl.scaffoldDrawerKey.currentState!.closeDrawer();
                indexCtrl.scaffoldKey.currentState!.closeDrawer();
                indexCtrl.isOpen.value = !indexCtrl.isOpen.value;
              }
            },
            child: const Icon(Icons.menu))
      ]);
    });
  }
}
