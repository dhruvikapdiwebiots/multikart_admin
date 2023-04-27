import 'package:multikart_admin/config.dart';

class Variant extends StatelessWidget {
  const Variant({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (_) {
      return Container(
        color: Colors.black45,
      );
    });
  }
}
