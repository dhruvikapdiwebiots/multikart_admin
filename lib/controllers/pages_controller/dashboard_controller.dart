
import '../../config.dart';

class DashboardController extends GetxController{
  final List<Map<String, dynamic>> listItem = [
    {
      'title': 'Total Users',
      'value': '500',
      'icon': svgAssets.sun,
      'boxColor': ['FEBE99', 'F66F94'],
    },
    {
      'title': 'Total Banners',
      'value': '5',
      'icon': svgAssets.sun,
      'boxColor': ['43D5E7', '7DB1F0'],
    },
    {

      'title': 'Total Products',
      'value': '170',
      'icon': svgAssets.sun,
      'boxColor': ['8DDAD3', '3CC2AE'],
    },
    {

      'title': 'Total Sales',
      'value': '28,060',
      'icon': svgAssets.orders,
      // 'boxColor': '004FC4',
      'boxColor': ['A100DA', '400370'],
    },
  ];
}