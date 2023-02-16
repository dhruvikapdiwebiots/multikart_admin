

import '../../../config.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<BannerController>(
      builder: (bannerCtrl) {
        return IconButton(
          icon:  Icon(Icons.arrow_back_ios, size: 16,color: appCtrl.appTheme.gray,),
          onPressed: bannerCtrl.currentPage == 1
              ? null
              : () {
            var nextSet =
                bannerCtrl.currentPage - bannerCtrl.currentPerPage!;
            bannerCtrl.currentPage = nextSet > 1 ? nextSet : 1;
            bannerCtrl.resetData(start: bannerCtrl.currentPage - 1);
            bannerCtrl.update();
          },
          padding: const EdgeInsets.symmetric(horizontal: 15),
        );
      }
    );
  }
}
