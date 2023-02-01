import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:multikart_admin/common/assets/svg_asset.dart';
import 'package:multikart_admin/common/theme/app_css.dart';
import 'package:multikart_admin/config.dart';
import 'package:multikart_admin/extensions/spacing.dart';
import 'package:multikart_admin/extensions/widget_extension.dart';
import 'package:multikart_admin/routes/index.dart';
import 'package:multikart_admin/widgets/common_button.dart';
import 'package:multikart_admin/widgets/common_text_box.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appCtrl.appTheme.whiteColor,
      body: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        borderRadius: 20,
        blur: 20,
        alignment: Alignment.bottomCenter,
        border: 2,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.1),
              const Color(0xFFFFFFFF).withOpacity(0.05),
            ],
            stops: const [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.5),
            const Color((0xFFFFFFFF)).withOpacity(0.5),
          ],
        ),
        child: GlassmorphicContainer(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          borderRadius: 20,
          blur: 20,
          alignment: Alignment.bottomCenter,
          border: 2,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                appCtrl.appTheme.secondary.withOpacity(0.1),
                Colors.white.withOpacity(.1),
                appCtrl.appTheme.secondary.withOpacity(0.1),
              ],
              stops: const [
                0.1,
                .3,
                1
              ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              appCtrl.appTheme.whiteColor.withOpacity(0.5),
              appCtrl.appTheme.whiteColor.withOpacity(0.5),
            ],
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                height: 56.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IntrinsicHeight(

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          SvgPicture.asset(!appCtrl.isTheme ? svgAssets.moon : svgAssets.sun,height: Sizes.s15,),
                          const HSpace(Sizes.s10),
                          Text( appCtrl.isTheme ? fonts.lightMode.tr : fonts.darkMode.tr,style: AppCss.nunitoSemiBold14.textColor(appCtrl.appTheme.blackColor))
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: VerticalDivider(
                        width: 1.0,
                        thickness: 1.0,

                        indent: 14.0,
                        endIndent: 14.0,
                      ),
                    ),
                    PopupMenuButton(
                      color: appCtrl.appTheme.whiteColor,
                      position: PopupMenuPosition.under,
                      child:Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 16 * 0.5),
                        constraints: const BoxConstraints(minWidth: 48.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(svgAssets.language,height: Sizes.s25),
                            Visibility(
                              visible: (MediaQuery.of(context).size.width > 768.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16 * 0.5),
                                child: Text(fonts.selectLanguage.tr,style: AppCss.nunitoSemiBold14.textColor(appCtrl.appTheme.blackColor)),
                              ),
                            ),
                          ],
                        ),
                      ) ,
                      itemBuilder: (context) {
                        return [
                          ...appArray.actionList
                              .asMap()
                              .entries
                              .map((e) => PopupMenuItem<int>(
                            value: 0,
                            onTap: () {
                              log("message : ${e.key}");
                            },
                            child: Text(
                              e.value["title"].toString().tr,
                              style: AppCss.nunitoMedium14
                                  .textColor(appCtrl.appTheme.blackColor),
                            ).inkWell(onTap: () {
                            }),
                          ))
                              .toList(),
                        ];
                      },
                    ),
                    const SizedBox(width: 16 * 0.5),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: Insets.i15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 5,
                          color: Colors.black12.withOpacity(0.1),
                        )
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                      child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 450, maxHeight: 700),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: appCtrl.appTheme.whiteColor,
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(35.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const VSpace(Sizes.s20),
                                    Image.asset(imageAssets.logo1,
                                        height: Sizes.s50,
                                        width: Sizes.s50,
                                        fit: BoxFit.fill),
                                    const VSpace(Sizes.s20),
                                    Text("Hello Again!",
                                        style: AppCss.nunitoblack28.textColor(
                                            appCtrl.appTheme.blackColor)),
                                    const VSpace(Sizes.s10),
                                    Text("Welcome back! Please enter your details",
                                            textAlign: TextAlign.center,
                                            style: AppCss.nunitoSemiBold14
                                                .textColor(appCtrl
                                                    .appTheme.contentColor))
                                        .paddingSymmetric(
                                            horizontal: Insets.i25),
                                    const VSpace(Sizes.s25),
                                    Text("Email",
                                            style: AppCss.nunitoBold16
                                                .textColor(appCtrl
                                                    .appTheme.contentColor))
                                        .alignment(Alignment.centerLeft),
                                    const VSpace(Sizes.s8),
                                    const SizedBox(
                                        height: Sizes.s35,
                                        child: CommonTextBox(
                                            hinText: "Enter Your Email",
                                            labelText: "Email")),
                                    const VSpace(Sizes.s22),
                                    Text("Password",
                                            style: AppCss.nunitoBold16
                                                .textColor(appCtrl
                                                    .appTheme.contentColor))
                                        .alignment(Alignment.centerLeft),
                                    const VSpace(Sizes.s8),
                                    const SizedBox(
                                        height: Sizes.s35,
                                        child: CommonTextBox(
                                            hinText: "Enter Password",
                                            labelText: "Password")),
                                    const VSpace(Sizes.s30),
                                    CommonButton(
                                        title: "Sign In",
                                        margin: 0,
                                        onTap: ()=>Get.toNamed(routeName.dashboard),
                                        padding: 0,
                                        height: Sizes.s35,
                                        style: AppCss.nunitoMedium14
                                            .textColor(appCtrl.appTheme.white)),
                                    const VSpace(Sizes.s12),
                                    IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.lock,
                                              size: Sizes.s15,
                                              color:
                                                  appCtrl.appTheme.blackColor),
                                          const HSpace(Sizes.s5),
                                          Text("Forgot your password",
                                              style: AppCss.nunitoblack16
                                                  .textColor(appCtrl
                                                      .appTheme.blackColor)),
                                        ],
                                      ),
                                    ),
                                    const VSpace(Sizes.s25),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "Do not have admin credentials?  ",
                                          style: AppCss.nunitoMedium16
                                              .textColor(
                                                  appCtrl.appTheme.blackColor)
                                              .letterSpace(.2)),
                                      TextSpan(
                                          text: "Sign Up",
                                          style: AppCss.nunitoblack16
                                              .textColor(
                                                  appCtrl.appTheme.primary)
                                              .letterSpace(.2))
                                    ])),
                                    const VSpace(Sizes.s30),
                                  ],
                                ),
                              ))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
