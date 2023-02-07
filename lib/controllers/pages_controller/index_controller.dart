
import 'package:multikart_admin/pages/banner/banner.dart';
import 'package:multikart_admin/pages/dashboard/dashboard.dart';
import 'package:multikart_admin/pages/notification/notification.dart';
import 'package:multikart_admin/pages/static_page/static_page.dart';

import '../../config.dart';

class IndexLayoutController extends GetxController{
  ValueNotifier<bool> isOpen = ValueNotifier(true);
  final GlobalKey<ScaffoldState> scaffoldDrawerKey =
  GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> scaffoldKey =
  GlobalKey<ScaffoldState>();
  int selectedIndex = 1;
  String pageName ="dashboard";
  bool isHover = false;
  int isSelectedHover = 0;

  final ScrollController scrollController = ScrollController();

  //list of bottommost page
  List<Widget> widgetOptions = <Widget>[
    Dashboard(),
    BannerPage(),
    StaticPage(),
    NotificationPage(),
    Text("Logout")
  ];
}