import 'package:multikart_admin/controllers/pages_controller/banner_controller.dart';

import '../../../config.dart';

class BannerSearchAction extends StatelessWidget {
  const BannerSearchAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(
      builder: (bannerCtrl) {
        return Row(
          children: [
            if (bannerCtrl.isSearch)
              Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText:
                        'Enter search term based on ${bannerCtrl.searchKey!.replaceAll(RegExp('[\\W_]+'), ' ').toUpperCase()}',
                        prefixIcon: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () {
                              bannerCtrl.isSearch = false;
                              bannerCtrl.initializeData();
                              bannerCtrl.update();
                            }),
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {})),
                    onSubmitted: (value) {
                      bannerCtrl.filterData(value);
                    },
                  )),
            if (!bannerCtrl.isSearch)
              IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    bannerCtrl.isSearch = true;
                    bannerCtrl.update();
                  })
          ],
        );
      }
    );
  }
}
