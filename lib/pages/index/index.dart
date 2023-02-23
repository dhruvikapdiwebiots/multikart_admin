import 'package:multikart_admin/config.dart';

class IndexLayout extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldDrawerKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const IndexLayout({Key? key, this.scaffoldDrawerKey, this.scaffoldKey})
      : super(key: key);

  @override
  State<IndexLayout> createState() => _IndexLayoutState();
}

class _IndexLayoutState extends State<IndexLayout> {
  final indexCtrl = Get.put(IndexLayoutController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexLayoutController>(builder: (_) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Title(
          title: "Multikart Admin",
          color: Colors.redAccent,
          child: Scaffold(
              key: widget.scaffoldKey,
              appBar: AppBar(
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                  centerTitle: false,
                  backgroundColor: appCtrl.appTheme.whiteColor,
                  leadingWidth: Responsive.isDesktop(context) ? 392 : 100,
                  title: !Responsive.isDesktop(context)
                      ? Text(indexCtrl.pageName.tr)
                      : Container(),
                  leading:  LeadingRow(scaffoldKey: widget.scaffoldKey,scaffoldDrawerKey: widget.scaffoldDrawerKey),
                  actions: const [DarkLanguageLayout()]),
              drawerScrimColor: Colors.transparent,
              drawer: const IndexDrawer(),
              body: SafeArea(
                  child: Scaffold(
                      backgroundColor: appCtrl.appTheme.whiteColor,
                      key: widget.scaffoldDrawerKey,
                      body: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ValueListenableBuilder<bool>(
                                valueListenable: indexCtrl.isOpen,
                                builder: (context, value, child) {
                                  return Responsive.isDesktop(context)
                                      ? Container(
                                          height:
                                              MediaQuery.of(context).size.height,
                                          width: value ? Sizes.s240 : Sizes.s70,
                                          color: appCtrl.appTheme.blackColor1,
                                          child: SingleChildScrollView(
                                              controller: ScrollController(),
                                              child: Column(
                                                  crossAxisAlignment: value
                                                      ? CrossAxisAlignment.start
                                                      : CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    DrawerList(value: value)
                                                  ])))
                                      : const SizedBox.shrink();
                                }),
                            const SelectedIndexBodyLayout()
                          ])))),
        ),
      );
    });
  }
}
