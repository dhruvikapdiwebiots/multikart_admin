

import 'package:quill_html_editor/quill_html_editor.dart';

import '../../config.dart';

class AboutUsDesktopLayout extends StatelessWidget {
  const AboutUsDesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaticController>(
      builder: (staticCtrl) {
        return SingleChildScrollView(
          child: Column(children: [
            Row(children: [
              Expanded(
                  child: CommonInputLayout(
                    controller: staticCtrl.txtAboutUs,
                      title: fonts.aboutUsLink.tr,
                      hinText: fonts.aboutUs.tr)),
              const HSpace(Sizes.s10),
              Expanded(
                  child: CommonInputLayout(
                      controller: staticCtrl.txtContactUs,
                      title: fonts.contactUsLink.tr,
                      hinText: fonts.contactUs.tr)),
              const HSpace(Sizes.s10),
              Expanded(
                  child: CommonInputLayout(
                      controller: staticCtrl.txtTermsCondition,
                      title: fonts.termsConditionLink.tr,
                      hinText: fonts.termsCondition.tr)),
              const HSpace(Sizes.s10),
              Expanded(
                  child: CommonInputLayout(
                      controller: staticCtrl.txtPrivacyPolicy,
                      title: fonts.privacyPolicyLink.tr,
                      hinText: fonts.privacyPolicy.tr)),
            ]).paddingSymmetric(horizontal: Insets.i15, vertical: Insets.i20),
            const VSpace(Sizes.s20),
            CommonButton(
                title: fonts.update.tr,
                width: Sizes.s100,
                //onTap: ()=>staticCtrl.updateData(),
                onTap: ()async{

                  var selectedText = await staticCtrl.controller.getText();
                  await staticCtrl.controller.setText(selectedText);
                  print("object : $selectedText");
                  staticCtrl.txtAboutUs.text = selectedText;
                  staticCtrl.update();
                },
                style: AppCss.nunitoblack14
                    .textColor(appCtrl.appTheme.white))
                .alignment(Alignment.bottomRight),
            const VSpace(Sizes.s20),
            ToolBar(
              toolBarColor: appCtrl.appTheme.primary,
              padding: const EdgeInsets.all(8),
              iconSize: 25,
              iconColor: staticCtrl.toolbarIconColor,

              activeIconColor: Colors.white,
              controller: staticCtrl.controller,
            ),
            QuillHtmlEditor(
              text: "<h1>Hello</h1>This is a quill html editor example 😊",
              hintText: 'Hint text goes here',
              controller: staticCtrl.controller,
              isEnabled: true,
              height: MediaQuery.of(context).size.height,
              textStyle: staticCtrl.editorTextStyle,
              hintTextStyle: staticCtrl.hintTextStyle,
              hintTextAlign: TextAlign.start,
              padding: const EdgeInsets.only(left: 10, top: 5),
              hintTextPadding: EdgeInsets.zero,
              backgroundColor: staticCtrl.backgroundColor,
              onFocusChanged: (hasFocus) => debugPrint('has focus $hasFocus'),
              onTextChanged: (text) => debugPrint('widget text change $text'),
              onEditorCreated: () => debugPrint('Editor has been loaded'),
            )
          ]),
        );
      }
    );
  }
}
