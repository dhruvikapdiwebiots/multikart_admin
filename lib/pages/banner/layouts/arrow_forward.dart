
import '../../../config.dart';

class ArrowForward extends StatelessWidget {
  const ArrowForward({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(
      builder: (bannerCtrl) {
        return IconButton(
          icon: Icon(Icons.arrow_forward_ios, size: 16,color: appCtrl.appTheme.gray),
          onPressed: bannerCtrl.currentPage + bannerCtrl.currentPerPage! - 1 >
              bannerCtrl.total
              ? null
              : () {
            var nextSet =
                bannerCtrl.currentPage + bannerCtrl.currentPerPage!;
            bannerCtrl.currentPage = nextSet < bannerCtrl.total
                ? nextSet
                : bannerCtrl.total - bannerCtrl.currentPerPage!;
            bannerCtrl.resetData(start: nextSet - 1);
            bannerCtrl.update();
          },
          padding: const EdgeInsets.symmetric(horizontal: 15),
        );
      }
    );
  }
}
