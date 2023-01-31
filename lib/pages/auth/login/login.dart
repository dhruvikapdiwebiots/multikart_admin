import 'dart:developer';

import 'package:google_fonts/google_fonts.dart';
import 'package:multikart_admin/common/theme/app_css.dart';
import 'package:multikart_admin/config.dart';
import 'package:multikart_admin/extensions/spacing.dart';
import 'package:multikart_admin/extensions/widget_extension.dart';
import 'package:multikart_admin/widgets/common_button.dart';
import 'package:multikart_admin/widgets/common_text_box.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("login");
    return Scaffold(
      backgroundColor: appCtrl.appTheme.whiteColor,
      body: Container(
       color: Color(0xFFF8F8F8),
        child: Center(
          child: Card(
            color: appCtrl.appTheme.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: 400, maxHeight: 700),
              padding: EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const VSpace(Sizes.s20),
                    Image.asset(imageAssets.logo),
                    const VSpace(Sizes.s30),
                    Text("Login",
                        style: GoogleFonts.nunito(
                            fontSize: 30, fontWeight: FontWeight.bold,color: appCtrl.appTheme.blackColor)),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Email").alignment(Alignment.centerLeft),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                        height: 35,child: CommonTextBox(hinText: "Email", labelText: "Email")),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Password").alignment(Alignment.centerLeft),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                        height: 35,child: CommonTextBox(hinText: "123", labelText: "Password")),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CommonButton(
                      title: "Login",
                      margin: 0,
                      padding: 0,
                      height: Sizes.s35,
                      style:
                          AppCss.nunitoMedium14.textColor(appCtrl.appTheme.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Do not have admin credentials? ",
                          style: AppCss.nunitoMedium16
                              .textColor(appCtrl.appTheme.blackColor).letterSpace(.2)),
                      TextSpan(
                          text: "Sign Up",
                          style: AppCss.nunitoblack16
                              .textColor(appCtrl.appTheme.primary).letterSpace(.2))
                    ])),  const VSpace(Sizes.s30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
