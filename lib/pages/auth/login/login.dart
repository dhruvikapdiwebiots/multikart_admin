import 'package:multikart_admin/config.dart';

class Login extends StatelessWidget {
  final loginCtrl = Get.put(LoginController());

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: appCtrl.appTheme.primary),
        home: Builder(builder: (context) {
          return Scaffold(
              backgroundColor: appCtrl.appTheme.whiteColor,
              body: GlassMorphicLayout(
                  linearGradient: backgroundLinearGradient(),
                  child: GlassMorphicLayout(
                      linearGradient: loginLinearGradient(),
                      child: Column(children: const [
                        DarkLanguageLayout(),
                        VSpace(Sizes.s80),
                        LoginLayout()
                      ]))));
        }),
      );
    });
  }
}
