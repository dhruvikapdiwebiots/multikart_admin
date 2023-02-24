import '../config.dart';

class AppArray {
  //language list
  var languageList = [
    {'name': 'english', 'locale': const Locale('en', 'US')},
    {'name': 'arabic', 'locale': const Locale('ar', 'AE')},
    {'name': 'hindi', 'locale': const Locale('hi', 'IN')},
    {'name': 'korean', 'locale': const Locale('ko', 'KR')}
  ];

  //bottom list
  var drawerList = [
    {'icon': svgAssets.banner, 'title': "banners", "otherList": []},
    {
      'icon': svgAssets.page,
      'title': "staticPage",
      "otherList": [
        {"title": "aboutUs"},
        {"title": "contactUs"},
        {"title": "termsCondition"},
        {"title": "privacyPolicy"},
      ]
    },
    {'icon': svgAssets.bell, 'title': "notification", "otherList": []},
    {'icon': svgAssets.logout, 'title': "logout", "otherList": []},
  ];

  //action list
  var actionList = [
    {'title': "english"},
    {'title': "hindi"},
    {'title': "korean"},
    {'title': "arabic"},
  ];

  //statusAction list
  var statusAction = [
    {'title': "setting"},
  ];

  //callAction list
  var callsAction = [
    {'title': "clearLogs"},
    {'title': "setting"}
  ];

  //setting list
  var settingList = [
    {'icon': Icons.message, 'title': "chats"},
    {'icon': Icons.delete_forever, 'title': "deleteAccount"},
    {'icon': Icons.logout, 'title': "logout"},
  ];
}
