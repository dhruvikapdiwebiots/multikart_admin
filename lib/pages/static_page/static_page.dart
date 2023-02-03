

import '../../config.dart';
import '../../responsive.dart';

class StaticPage extends StatelessWidget {
  const StaticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Responsive.isDesktop(context)
          ? Column(
              children: [
                Row(children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("About Us Link"),
                      const VSpace(Sizes.s10),
                      CommonTextBox(hinText: "About Us"),
                    ],
                  )),
                  const HSpace(Sizes.s10),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contact Us Link"),
                      const VSpace(Sizes.s10),
                      CommonTextBox(hinText: "Contact Us"),
                    ],
                  )),
                  const HSpace(Sizes.s10),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Terms & Condition Link"),
                      const VSpace(Sizes.s10),
                      CommonTextBox(hinText: "Terms & Condition"),
                    ],
                  )),
                  const HSpace(Sizes.s10),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Privacy Policy Link"),
                      const VSpace(Sizes.s10),
                      CommonTextBox(hinText: "Privacy Policy"),
                    ],
                  )),
                ]).paddingSymmetric(
                    horizontal: Insets.i15, vertical: Insets.i20),
                const VSpace(Sizes.s20),
                CommonButton(
                  title: "Update",
                  width: Sizes.s100,
                  style: AppCss.nunitoblack14.textColor(appCtrl.appTheme.white),
                ).alignment(Alignment.bottomRight),
                const VSpace(Sizes.s20),
              ],
            )
          : Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About Us Link"),
                  const VSpace(Sizes.s10),
                  CommonTextBox(hinText: "About Us"),
                ],
              ),
              const VSpace(Sizes.s15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Us Link"),
                  const VSpace(Sizes.s10),
                  CommonTextBox(hinText: "Contact Us"),
                ],
              ),
              const VSpace(Sizes.s15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Terms & Condition Link"),
                  const VSpace(Sizes.s10),
                  CommonTextBox(hinText: "Terms & Condition"),
                ],
              ),
              const VSpace(Sizes.s15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Privacy Policy Link"),
                  const VSpace(Sizes.s10),
                  CommonTextBox(hinText: "Privacy Policy"),
                ],
              ),
              const VSpace(Sizes.s20),
              CommonButton(
                title: "Update",
                width: Sizes.s100,
                style: AppCss.nunitoblack14.textColor(appCtrl.appTheme.white),
              ).alignment(Alignment.bottomRight)
            ]).paddingSymmetric(horizontal: Insets.i15, vertical: Insets.i20),
    );
  }
}
