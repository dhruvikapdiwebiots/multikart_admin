import '../../../config.dart';

class DesktopTextFieldCommon extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final bool? isNote, isAppSettings, obscureText;
  final double? width;
  final ValueChanged<String>? onChanged;

  const DesktopTextFieldCommon(
      {Key? key,
      this.title,
      this.controller,
      this.validator,
      this.isNote,
      this.isAppSettings,
      this.width,
      this.obscureText = false,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title!.tr,
          style: AppCss.nunitoMedium18
              .textColor(appCtrl.appTheme.darkGray)
              .textHeight(1.5)),
      const VSpace(Sizes.s15),
      TextFormField(
          style: AppCss.nunitoMedium14.textColor(appCtrl.appTheme.gray),
          validator: validator,
          obscureText: obscureText!,
          keyboardType: TextInputType.multiline,
          cursorColor: appCtrl.appTheme.primary,
          controller: controller!,
          onChanged: onChanged,
          decoration: InputDecoration(
            errorStyle: AppCss.nunitoMedium10,
            isDense: true,
            filled: true,
            hintText: title.toString().tr,
            fillColor: appCtrl.appTheme.gray.withOpacity(0.1),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.r8)),
                borderSide: BorderSide(width: 0, style: BorderStyle.none)),
            contentPadding: const EdgeInsets.symmetric(
                vertical: Insets.i18, horizontal: Insets.i10),
          ))
    ]);
  }
}
