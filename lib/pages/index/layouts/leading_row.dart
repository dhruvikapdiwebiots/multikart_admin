import 'dart:developer';

import '../../../config.dart';

class LeadingRow extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldDrawerKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const LeadingRow({Key? key, this.scaffoldKey, this.scaffoldDrawerKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexLayoutController>(builder: (indexCtrl) {
      return Row(children: [
        ValueListenableBuilder<bool>(
            valueListenable: indexCtrl.isOpen,
            builder: (context, value, child) {
              if (Responsive.isDesktop(context) && value) {
                return InkWell(
                    onTap: () {},
                    child: Container(
                        width: Sizes.s240,

                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: appCtrl.appTheme.bgColor

                        ),
                        child: Container(
                            width: Sizes.s240,

                            margin: const EdgeInsets.only(bottom: Insets.i1),
                            padding: const EdgeInsets.all(Insets.i20),
                            decoration: BoxDecoration(
                                color: appCtrl.appTheme.bgColor,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.white12 ,
                                      blurRadius: 2,
                                      spreadRadius: 2)
                                ]
                            ),

                            height: double.infinity,
                            child: Image.asset(imageAssets.logo2))));
              }
              return InkWell(
                  onTap: () {
                    log("message : ${indexCtrl.scaffoldDrawerKey}");
                    scaffoldDrawerKey!.currentState?.closeDrawer();
                  },
                  child: Responsive.isDesktop(context)
                      ? Container(
                          width: Sizes.s70,
                          color: appCtrl.appTheme.bgColor,
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
              log("message : $scaffoldDrawerKey");
              if (Responsive.isMobile(context) ||
                  Responsive.isTablet(context)) {
                if (scaffoldKey!.currentState!.isDrawerOpen) {
                  scaffoldKey!.currentState!.closeDrawer();
                } else {
                  scaffoldKey!.currentState!.openDrawer();
                }
              } else if (Responsive.isDesktop(context)) {
                scaffoldKey!.currentState!.closeDrawer();
                indexCtrl.isOpen.value = !indexCtrl.isOpen.value;
              }
            },
            child: Icon(
              Icons.menu,
              color: appCtrl.appTheme.blackColor,
            ))
      ]);
    });
  }
}
