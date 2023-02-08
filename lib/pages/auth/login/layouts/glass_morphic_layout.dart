import 'dart:ui';



import '../../../../config.dart';

class GlassMorphicLayout extends StatelessWidget {
  final LinearGradient? linearGradient;
  final Widget? child;
  const GlassMorphicLayout({Key? key,this.child,this.linearGradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return GlassmorphicContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        borderRadius: AppRadius.r20,
        blur: 20,
        alignment: Alignment.bottomCenter,
        border: 2,
        borderGradient: commonLinearGradient(),
        linearGradient: linearGradient!,child: child,);*/
    return Container(
      key: key,
      width:  MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(AppRadius.r20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20 * 2),
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.r20),
                  gradient: linearGradient,
                ),
              ),
            ),
          ),
          GlassmorphicBorder(
            strokeWidth: 2,
            radius: AppRadius.r20,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            gradient: commonLinearGradient(),
          ),
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(AppRadius.r20),
            child: Container(
              child: child,
              alignment: Alignment.bottomCenter,
            ),
          ),
        ],
      ),
    );
  }
}

class GlassmorphicBorder extends StatelessWidget {

  final double _radius;
  final width;
  final height;
  const GlassmorphicBorder({super.key,
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
    this.height,
    this.width,
  })  :
        this._radius = radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(_radius)),
      ),
      width: width,
      height: height,
    );
  }
}



