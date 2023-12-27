
import 'package:multikart_admin/pages/terms_condition/terms_condition_desktop_layout.dart';
import 'package:multikart_admin/pages/terms_condition/terms_condition_mobile_layout.dart';

import '../../config.dart';
import '../../controllers/pages_controller/terms_condition_controller.dart';

class TermsCondition extends StatelessWidget {
  final termsCtrl = Get.put(TermsConditionController());

  TermsCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TermsConditionController>(builder: (_) {
      return Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Card(
                      elevation: 3,
                      surfaceTintColor: appCtrl.appTheme.whiteColor,
                      shadowColor: appCtrl.appTheme.blackColor,
                      color: appCtrl.appTheme.whiteColor,
                      child: Responsive.isDesktop(context)
                          ? const TermsConditionDesktopLayout()
                          : const TermsConditionMobileLayout().paddingSymmetric(
                              horizontal: Insets.i15, vertical: Insets.i20)),
                  if (termsCtrl.isLoading)
                    const Center(child: CircularProgressIndicator())
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}
