import 'dart:developer';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:multikart_admin/pages/index/index.dart';

import 'common/language/index.dart';
import 'common/theme/theme_service.dart';
import 'config.dart';
import 'routes/index.dart';

import 'dart:html' as html;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // We're using the manual installation on non-web platforms since Google sign in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391
  GetStorage.init();
  Get.put(AppController());
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDpKjtQNKZTqJNNCD8R6qtzjBre75fDMQE",
        authDomain: "multikart-e57bb.firebaseapp.com",
        projectId: "multikart-e57bb",
        storageBucket: "multikart-e57bb.appspot.com",
        messagingSenderId: "713436851366",
        appId: "1:713436851366:web:a732769651136370391867",
        measurementId: "G-W6GMZ16VRT"),
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    appCtrl.isLogin = html.window.localStorage[session.isLogin] ?? "false";
    return GetMaterialApp(
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget!,
        );
      },
      debugShowCheckedModeBanner: false,
      translations: Language(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      // tran
      title: "Multikart Admin",
      home: appCtrl.isLogin == "true" ?IndexLayout() : Login(),
      getPages: appRoute.getPages,
      theme: AppTheme.fromType(ThemeType.light).themeData,
      darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
      themeMode: ThemeService().theme,
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
