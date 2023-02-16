import '../../../config.dart';

class AddBanner extends StatelessWidget {
  const AddBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return GetBuilder<BannerController>(builder: (bannerCtrl) {
        return Stack(alignment: Alignment.topCenter, children: [
          AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                  decoration: BoxDecoration(
                      color: appCtrl.appTheme.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: appCtrl.isTheme ?  1 :0,
                          spreadRadius: appCtrl.isTheme ?  1 :0,
                          color: appCtrl.appTheme.blackColor
                        )
                      ]),
                  width: Sizes.s500,
                  child:
                      Stack(alignment: Alignment.topRight, children: <Widget>[
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      BannerCommonClass().addBannerTitle(),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextBox(
                                    hinText: fonts.name.tr,
                                    controller: bannerCtrl.txtTitle),
                                const VSpace(Sizes.s15),
                                CommonTextBox(
                                    hinText: fonts.productCollectionId.tr,
                                    controller: bannerCtrl.txtId),
                                const VSpace(Sizes.s15),
                                const BannerProductCollection()
                              ])),
                      const BannerImageLayout(),
                      const VSpace(Sizes.s10),
                      if (bannerCtrl.isUploadSize)
                        Column(children: [
                          const VSpace(Sizes.s5),
                          Text(fonts.imageError.tr,
                              style: AppCss.nunitoMedium12
                                  .textColor(appCtrl.appTheme.redColor))
                        ]),
                      const VSpace(Sizes.s25),
                      CommonButton(
                          icon: bannerCtrl.isLoading
                              ? CircularProgressIndicator(
                                      color: appCtrl.appTheme.white)
                                  .paddingSymmetric(vertical: Insets.i10)
                              : Container(),
                          title: bannerCtrl.isLoading
                              ? "loading.."
                              : bannerCtrl.bannerId != ""
                                  ? "Update"
                                  : fonts.submit.tr,
                          onTap: () => bannerCtrl.uploadFile(),
                          style: AppCss.nunitoblack14
                              .textColor(appCtrl.appTheme.white)),
                      const VSpace(Sizes.s15)
                    ]),
                    Positioned(
                        right: 15.0,
                        top: 15.0,
                        child: InkResponse(
                            onTap: () => Navigator.of(context).pop(),
                            child: CircleAvatar(
                                radius: 12,
                                backgroundColor: appCtrl.appTheme.primary,
                                child: Icon(Icons.close,
                                    size: 18, color: appCtrl.appTheme.white))))
                  ]))),
          CustomSnackBar(isAlert: bannerCtrl.isAlert)
        ]);
      });
    });
  }
}
