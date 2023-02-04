

import '../../config.dart';

class StaticPage extends StatelessWidget {
  const StaticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Responsive.isDesktop(context)
          ? const StaticDesktopLayout()
          : const StaticMobileLayout().paddingSymmetric(horizontal: Insets.i15, vertical: Insets.i20),
    );
  }
}
