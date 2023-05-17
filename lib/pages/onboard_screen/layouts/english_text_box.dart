import 'package:multikart_admin/pages/onboard_screen/layouts/desktop_text_field_common.dart';

import '../../../config.dart';

class EnglishTextBox extends StatelessWidget {
  final TextEditingController? txtTitle, txtDesc;
  const EnglishTextBox({Key? key, this.txtTitle, this.txtDesc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DesktopTextFieldCommon(
                  controller: txtTitle,
                  validator: (number) =>
                      LoginValidator().statusValidation(number),
                  title: fonts.title,
                  onChanged: (val) {},
                ),
              ]).marginOnly(top: Insets.i15),
        ),
        const HSpace(Sizes.s30),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DesktopTextFieldCommon(
                    controller: txtDesc,
                    validator: (number) =>
                        LoginValidator().statusValidation(number),
                    title: fonts.description,
                    onChanged: (val) {}),
              ]).marginOnly(top: Insets.i15),
        ),
      ],
    );
  }
}
