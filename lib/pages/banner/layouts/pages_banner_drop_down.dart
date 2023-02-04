import 'package:multikart_admin/controllers/pages_controller/banner_controller.dart';

import '../../../config.dart';

class PageDropDown extends StatelessWidget {
  const PageDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(
      builder: (bannerCtrl) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: DropdownButton<int>(
            value: bannerCtrl.currentPerPage,
            items: bannerCtrl.perPages
                .map((e) => DropdownMenuItem<int>(
              value: e,
              child: Text("$e"),
            ))
                .toList(),
            onChanged: (dynamic value) {
              bannerCtrl.currentPerPage = value;
              bannerCtrl.currentPage = 1;
              bannerCtrl.resetData();
              bannerCtrl.update();
            },
            isExpanded: false,
          ),
        );
      }
    );
  }
}
