
import 'package:multikart_admin/pages/privacy_policy/privacy_policy_desktop_layout.dart';
import 'package:multikart_admin/pages/privacy_policy/privacy_policy_mobile_layout.dart';

import '../../config.dart';
import '../../controllers/pages_controller/privacy_policy_controller.dart';

class PrivacyPolicy extends StatelessWidget {
  final staticCtrl = Get.put(PrivacyPolicyController());

  PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyPolicyController>(builder: (_) {
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
                          ? const PrivacyPolicyDesktopLayout()
                          : const PrivacyPolicyMobileLayout().paddingSymmetric(
                              horizontal: Insets.i15, vertical: Insets.i20)),
                  if (staticCtrl.isLoading)
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
