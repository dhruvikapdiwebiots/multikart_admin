//app file

import 'package:multikart_admin/pages/about_app_page/AboutApp.dart';
import 'package:multikart_admin/pages/contact_us/contact_us.dart';
import 'package:multikart_admin/pages/onboard_screen/onboard_screen.dart';
import 'package:multikart_admin/pages/privacy_policy/privacy_policy.dart';
import 'package:multikart_admin/pages/terms_condition/terms_condition.dart';
import 'package:multikart_admin/pages/variant/variant.dart';
import 'package:multikart_admin/routes/screen_list.dart';

import '../config.dart';
import 'route_name.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.login, page: () => Login()),
    GetPage(name: _routeName.index, page: () => const IndexLayout()),
    GetPage(name: _routeName.banner, page: () => BannerPage()),
    GetPage(name: _routeName.aboutsUs, page: () => AboutUsPage()),
    GetPage(name: _routeName.contactUs, page: () => ContactUs()),
    GetPage(name: _routeName.termsCondition, page: () => TermsCondition()),
    GetPage(name: _routeName.privacyPolicy, page: () => PrivacyPolicy()),
    GetPage(name: _routeName.notification, page: () => NotificationPage()),
    GetPage(name: _routeName.variant, page: () => VariantScreen()),
    GetPage(name: _routeName.aboutApp, page: () => AboutApp()),
    GetPage(name: _routeName.onBoarding, page: () => OnboardScreen()),
  ];
}
