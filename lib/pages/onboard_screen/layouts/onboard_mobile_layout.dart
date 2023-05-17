import 'package:multikart_admin/controllers/pages_controller/onboard_controller.dart';
import 'package:multikart_admin/widgets/common_widget_class.dart';

import '../../../../config.dart';

class OnboardMobileLayout extends StatelessWidget {
  final AsyncSnapshot<dynamic>? snapShot;

  const OnboardMobileLayout({Key? key, this.snapShot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(builder: (charactersCtrl) {
      return Column(children: [
        ...snapShot!.data!.docs.asMap().entries.map((e) {
          return Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    e.value.data()["image"] != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(AppRadius.r50),
                            child: Image.network(e.value.data()["image"],
                                height: Sizes.s50))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(AppRadius.r50),
                            child: Image.asset(imageAssets.logo,
                                height: Sizes.s50)),
                    const HSpace(Sizes.s10),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            CommonWidgetClass().commonValueText("Title - "),
                            CommonWidgetClass().commonValueText(
                                e.value.data()["title"] ?? "-"),
                          ]),
                          Row(children: [
                            CommonWidgetClass().commonValueText("Message - "),
                            CommonWidgetClass().commonValueText(
                                e.value.data()["message"] ?? "Not Defined")
                          ]).marginSymmetric(vertical: Insets.i5)
                        ])
                  ]),
                  // Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Icon(Icons.delete, color: appCtrl.appTheme.primary)
                  //           .inkWell(
                  //               onTap: () => accessDenied(
                  //                   fonts.deleteCharacterConfirmation,
                  //                   onTap: () {})),
                  //       CommonSwitcher(
                  //           isActive: e.value.data()["isActive"] ?? true,
                  //           onToggle: (val) {})
                  //     ])
                ]).paddingAll(Insets.i10),
          ).marginOnly(bottom: Insets.i15);
        }).toList()
      ]);
    });
  }
}
