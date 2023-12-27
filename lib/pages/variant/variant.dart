import 'package:multikart_admin/config.dart';
import 'package:multikart_admin/controllers/pages_controller/variant_controller.dart';
import 'package:multikart_admin/pages/variant/HomeVarient.dart';
import 'package:multikart_admin/pages/variant/productVarient.dart';

class VariantScreen extends StatelessWidget {
  final onboardCtrl = Get.put(VariantController());
  VariantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VariantController>(builder: (_) {
      return Container(
          margin: const EdgeInsets.all(Insets.i10),
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(maxHeight: 700),
          child: Card(
            elevation: 3,
            shadowColor: appCtrl.appTheme.blackColor,
            surfaceTintColor: appCtrl.appTheme.whiteColor,
            color: appCtrl.appTheme.whiteColor,
            clipBehavior: Clip.none,
            child: SingleChildScrollView(
              child: const Column(
                children: [
                  HomeVariant(),
                  VSpace(Sizes.s22),
                  ProductVariant()
                ],
              ).padding(all: Sizes.s20),
            ),
          ));
    });
  }
}
