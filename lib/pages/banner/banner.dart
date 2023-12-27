import '../../config.dart';

class BannerPage extends StatelessWidget {
  final bannerCtrl = Get.put(BannerController());

  BannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (_) {
      return bannerCtrl.isLoading
          ? Center(
              child: CircularProgressIndicator(color: appCtrl.appTheme.primary))
          : bannerCtrl.banner.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                      Container(
                        margin: const EdgeInsets.all(Insets.i10),
                        padding: const EdgeInsets.all(0),
                        constraints: const BoxConstraints(maxHeight: 700),
                        child: Card(
                            elevation: 3,
                            surfaceTintColor: appCtrl.appTheme.whiteColor,
                            shadowColor: appCtrl.appTheme.blackColor,
                            color: appCtrl.appTheme.whiteColor,
                            clipBehavior: Clip.none,
                            child: const BannerList()),
                      ),
                    ]))
              : Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        imageAssets.noData,
                        height: Sizes.s150,
                      ),
                      const VSpace(Sizes.s10),
                      Text(fonts.noBanner.tr),
                      const VSpace(Sizes.s10),
                      CommonButton(
                          title: fonts.addBanner.tr,
                          style: AppCss.nunitoMedium14
                              .textColor(appCtrl.appTheme.white),
                          width: Sizes.s150,
                          onTap: () => bannerCtrl.addBannerDialog()),
                    ],
                  ),
                );
    });
  }
}
