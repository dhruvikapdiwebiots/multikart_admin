//app file

import 'package:multikart_admin/routes/screen_list.dart';

import '../config.dart';
import 'route_name.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.login, page: () => const Login()),
    GetPage(name: _routeName.dashboard, page: () =>  Dashboard()),
  ];
}
