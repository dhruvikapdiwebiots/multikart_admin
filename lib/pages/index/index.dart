import 'package:multikart_admin/config.dart';


class IndexLayout extends StatelessWidget {
  final indexCtrl = Get.put(IndexLayoutController());

  IndexLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexLayoutController>(builder: (_) {
      return
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              key: indexCtrl.scaffoldKey,
              appBar: AppBar(
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                  centerTitle: false,
                  backgroundColor: appCtrl.appTheme.whiteColor,
                  leadingWidth: Responsive.isDesktop(context) ? 392 : 100,
                  title: !Responsive.isDesktop(context)
                      ? Text(indexCtrl.pageName.tr).backgroundColor(Colors.cyan)
                      : Container(),
                  leading: const LeadingRow(),
                  actions: const [DarkLanguageLayout()]),
              drawerScrimColor: Colors.transparent,
              drawer: const IndexDrawer(),
              body: SafeArea(
                  child: Scaffold(
                      key: indexCtrl.scaffoldDrawerKey,
                      body: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ValueListenableBuilder<bool>(
                                valueListenable: indexCtrl.isOpen,
                                builder: (context, value, child) {
                                  return Responsive.isDesktop(context)
                                      ? Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height,
                                      width:
                                      value ? Sizes.s240 : Sizes.s70,
                                      color: appCtrl.appTheme.blackColor1,
                                      child: SingleChildScrollView(
                                          controller: ScrollController(),
                                          child: Column(
                                              crossAxisAlignment: value
                                                  ? CrossAxisAlignment
                                                  .start
                                                  : CrossAxisAlignment
                                                  .center,
                                              mainAxisSize:
                                              MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                DrawerList(value: value)
                                              ])))
                                      : const SizedBox.shrink();
                                }),
                            const SelectedIndexBodyLayout()
                          ])))),
        );
    });
  }
}
