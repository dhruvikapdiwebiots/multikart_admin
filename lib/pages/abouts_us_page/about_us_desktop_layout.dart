

import 'package:quill_html_editor/quill_html_editor.dart';

import '../../config.dart';

class AboutUsDesktopLayout extends StatelessWidget {
  const AboutUsDesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaticController>(
      builder: (staticCtrl) {
        return SingleChildScrollView(
          child:  Column(children: [
            CommonButton(
                title: fonts.update.tr,
                width: Sizes.s100,

                onTap: (){
                  staticCtrl.updateData();

                },
                style: AppCss.nunitoblack14
                    .textColor(appCtrl.appTheme.white))
                .alignment(Alignment.bottomRight).marginSymmetric(vertical: Insets.i20),

            ToolBar(
              toolBarColor: appCtrl.appTheme.blackColor,
              padding: const EdgeInsets.all(8),
              iconSize: 20,
              iconColor: appCtrl.appTheme.whiteColor,

              activeIconColor: appCtrl.appTheme.primary,
              controller: staticCtrl.controller,
            ),
            QuillHtmlEditor(
              hintText: 'Hint text goes here',
              controller: staticCtrl.controller,
              isEnabled: true,
              minHeight: MediaQuery.of(context).size.height /2,
              textStyle: staticCtrl.editorTextStyle,
              hintTextStyle: staticCtrl.hintTextStyle,
              hintTextAlign: TextAlign.start,
              padding: const EdgeInsets.only(left: 10, top: 5),
              hintTextPadding: EdgeInsets.zero,
              backgroundColor: staticCtrl.backgroundColor,
              onFocusChanged: (hasFocus) => debugPrint('has focus $hasFocus'),
              onTextChanged: (text) => debugPrint('widget text change $text'),
              onEditorCreated: () => debugPrint('Editor has been loaded'),
            ),

          ]),
        );
      }
    );
  }
}
