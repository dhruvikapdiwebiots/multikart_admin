import '../../config.dart';

class IndexLayoutController extends GetxController {
  ValueNotifier<bool> isOpen = ValueNotifier(true);
  GlobalKey<ScaffoldState>? scaffoldDrawerKey;
  GlobalKey<ScaffoldState>? scaffoldKey;
  int selectedIndex = 0;
  int? subSelectIndex;
  int staticPageIndex = 0;
  String pageName = fonts.addBanner.tr;
  bool isHover = false;
  bool isSubHover = false;
  int isSelectedHover = 1;
  int isSubSelectedHover = 1;

  final ScrollController scrollController = ScrollController();

  //list of bottommost page
  List<Widget> widgetOptions = <Widget>[
    BannerPage(),
    Container(),
    NotificationPage(),
    Container()
  ];

  @override
  void onReady() {
    // TODO: implement onReady
    appCtrl.getStorageData();
    super.onReady();
  }

  setKey({GlobalKey<ScaffoldState>? scaffoldDrawerKey1,GlobalKey<ScaffoldState>? scaffoldKey1}){
    scaffoldDrawerKey = scaffoldDrawerKey1;
    scaffoldKey = scaffoldKey1;
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
