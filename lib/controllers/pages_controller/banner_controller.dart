
import 'dart:math';

import 'package:multikart_admin/extensions/widget_extension.dart';
import 'package:multikart_admin/pages/dashboard/dashboard.dart';

import '../../config.dart';

class BannerController extends GetxController{
  ScrollController scrollController = ScrollController();
  late DataSource dataSource;

  @override
  void onReady() {
    // TODO: implement onReady
    dataSource = DataSource(

      onDetailButtonPressed: (data) {},
      onDeleteButtonPressed: (data) {},
    );
    super.onReady();
  }
}

class DataSource extends DataTableSource {
  final void Function(Map<String, dynamic> data) onDetailButtonPressed;
  final void Function(Map<String, dynamic> data) onDeleteButtonPressed;

  final _data = List.generate(200, (index) {
    return {
      'image': "image",
      'no': index + 1,
      'item': 'Item ${index + 1}',
      'price': Random().nextInt(10000),
      'date': '2022-06-30',
    };
  });

  DataSource({
    required this.onDetailButtonPressed,
    required this.onDeleteButtonPressed,
  });

  @override
  DataRow? getRow(int index) {
    final data = _data[index];

    return DataRow( cells: [
      DataCell(Text(data['image'].toString()).decorated(color: appCtrl.appTheme.gray)),
      DataCell(Text(data['no'].toString()).decorated(color: appCtrl.appTheme.gray)),
      DataCell(Text(data['item'].toString())),
      DataCell(Text(data['price'].toString())),
      DataCell(Text(data['date'].toString())),
      DataCell(Builder(
        builder: (context) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: OutlinedButton(
                  onPressed: () => onDetailButtonPressed.call(data),

                  child: Text("crudDetail"),
                ),
              ),
              OutlinedButton(
                onPressed: () => onDeleteButtonPressed.call(data),
                child: Text("crudDelete"),
              ),
            ],
          );
        },
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}