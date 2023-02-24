

import 'package:multikart_admin/controllers/pages_controller/contact_us_controller.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../config.dart';
import '../../controllers/pages_controller/terms_condition_controller.dart';

class TermsConditionMobileLayout extends StatelessWidget {
  const TermsConditionMobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TermsConditionController>(
      builder: (staticCtrl) {
        return Column(children: [
          CommonButton(
              title: fonts.update.tr,
              width: Sizes.s100,
              //onTap: ()=>staticCtrl.updateData(),
              onTap: ()async{
                staticCtrl.updateData();

              },
              style: AppCss.nunitoblack14
                  .textColor(appCtrl.appTheme.white))
              .alignment(Alignment.bottomRight).marginSymmetric(vertical: Insets.i20),

          ToolBar(
            toolBarColor: appCtrl.appTheme.blackColor,
            padding: const EdgeInsets.all(8),
            iconSize: 25,
            iconColor: appCtrl.appTheme.whiteColor,

            activeIconColor: appCtrl.appTheme.whiteColor,
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
          ),
        ]);
      }
    );
  }
}
