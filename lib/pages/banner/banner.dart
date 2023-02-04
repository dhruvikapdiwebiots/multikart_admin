

import 'package:multikart_admin/pages/banner/layouts/banner_list.dart';

import '../../config.dart';


class BannerPage extends StatelessWidget {
  final bannerCtrl = Get.put(BannerController());

  BannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (_) {
      return SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
            Container(
              margin: const EdgeInsets.all(Insets.i10),
              padding: const EdgeInsets.all(0),
              constraints: const BoxConstraints(maxHeight: 700),
              child: const Card(
                  elevation: 1,
                  shadowColor: Colors.black,
                  clipBehavior: Clip.none,
                  child: BannerList()),
            ),
          ]));
    });
  }
}
