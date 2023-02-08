import '../../config.dart';

class BannerPage extends StatelessWidget {
  final bannerCtrl = Get.put(BannerController());

  BannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (_) {
      return bannerCtrl.banner.isNotEmpty ? SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.all(Insets.i10),
                  padding: const EdgeInsets.all(0),
                  constraints: const BoxConstraints(maxHeight: 700),
                  child:  const Card(
                      elevation: 1,
                      shadowColor: Colors.black,
                      clipBehavior: Clip.none,
                      child: BannerList()),
                ),
              ]))  : Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(imageAssets.noData,height: Sizes.s150,),
                  const VSpace(Sizes.s10),
                  Text("No Banner Available. For Add Click on Add Banner"),
                  const VSpace(Sizes.s10),
                  CommonButton(title: "Add Banner",style: AppCss.nunitoMedium14.textColor(appCtrl.appTheme.white),width: Sizes.s150,),
                ],
              ),);
    });
  }
}
