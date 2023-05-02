import 'package:multikart_admin/config.dart';
import 'package:multikart_admin/pages/variant/HomeVarient.dart';
import 'package:multikart_admin/pages/variant/productVarient.dart';

class VariantScreen extends StatelessWidget {
  const VariantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (_) {
      return Container(
          margin: const EdgeInsets.all(Insets.i10),
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(maxHeight: 700),
          child: Card(
            elevation: 3,
            shadowColor: appCtrl.appTheme.blackColor,
            color: appCtrl.appTheme.whiteColor,
            clipBehavior: Clip.none,
            child: Column(
              children: const [
                HomeVariant(),
                VSpace(Sizes.s18),
                ProductVariant()
              ],
            ).padding(all: Sizes.s20),
          ));
    });
  }
}
