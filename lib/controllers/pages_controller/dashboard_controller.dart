
import '../../config.dart';

class DashboardController extends GetxController{
  ValueNotifier<bool> isOpen = ValueNotifier(true);
  final GlobalKey<ScaffoldState> scaffoldDrawerKey =
  GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> scaffoldKey =
  GlobalKey<ScaffoldState>();

  final ScrollController scrollController = ScrollController();

}