import 'package:glassmorphism/glassmorphism.dart';


import '../../../../config.dart';

class GlassMorphicLayout extends StatelessWidget {
  final LinearGradient? linearGradient;
  final Widget? child;
  const GlassMorphicLayout({Key? key,this.child,this.linearGradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        borderRadius: AppRadius.r20,
        blur: 20,
        alignment: Alignment.bottomCenter,
        border: 2,
        borderGradient: commonLinearGradient(),
        linearGradient: linearGradient!,child: child,);
  }
}
