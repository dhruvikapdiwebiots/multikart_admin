

import 'package:multikart_admin/controllers/pages_controller/static_controller.dart';

import '../../config.dart';

class StaticPage extends StatelessWidget {
  final staticCtrl = Get.put(StaticController());
   StaticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaticController>(
      builder: (_) {
        return Card(
          elevation: 5,
          child: Responsive.isDesktop(context)
              ? const StaticDesktopLayout()
              : const StaticMobileLayout().paddingSymmetric(horizontal: Insets.i15, vertical: Insets.i20),
        );
      }
    );
  }
}
