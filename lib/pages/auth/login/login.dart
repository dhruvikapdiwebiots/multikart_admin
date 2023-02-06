
import 'package:multikart_admin/config.dart';

class Login extends StatelessWidget {
  final loginCtrl = Get.put(LoginController());
   Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
            backgroundColor: appCtrl.appTheme.whiteColor,
            body: GlassMorphicLayout(
                linearGradient: backgroundLinearGradient(),
                child: GlassMorphicLayout(
                    linearGradient: loginLinearGradient(),
                    child: Stack(
                        alignment: Alignment.topRight,
                        children: const [DarkLanguageLayout(), LoginLayout()]))));
      }
    );
  }
}
