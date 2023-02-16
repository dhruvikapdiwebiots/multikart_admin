import '../../../config.dart';

class CommonInputLayout extends StatelessWidget {
  final String? hinText,title;
  final TextEditingController? controller;
  final int? maxLines;
  const CommonInputLayout({Key? key,this.title,this.hinText,this.controller,this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toString().tr,style: AppCss.nunitoMedium14.textColor(appCtrl.appTheme.blackColor),),
        const VSpace(Sizes.s10),
        CommonTextBox(hinText: hinText.toString().tr,maxLines: maxLines,controller: controller),
      ],
    );
  }
}
