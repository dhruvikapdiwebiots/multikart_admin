

import '../../config.dart';

class IndexLayoutController extends GetxController{
  ValueNotifier<bool> isOpen = ValueNotifier(true);
  final GlobalKey<ScaffoldState> scaffoldDrawerKey =
  GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> scaffoldKey =
  GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  String pageName =fonts.addBanner.tr;
  bool isHover = false;
  int isSelectedHover = 0;

  final ScrollController scrollController = ScrollController();

  //list of bottommost page
  List<Widget> widgetOptions = <Widget>[

    BannerPage(),
    StaticPage(),
    NotificationPage(),
     Container()
  ];
}