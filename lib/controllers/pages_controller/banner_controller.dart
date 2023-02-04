import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/pages/banner/layouts/add_banner.dart';
import 'package:responsive_table/responsive_table.dart';

import '../../config.dart';
import '../../pages/banner/banner.dart';
import '../../pages/notification/notification.dart';
import '../../widgets/icon_creation.dart';

class BannerController extends GetxController {
  late List<DatatableHeader> headers;

  final List<int> perPages = [10, 20, 50, 100];
  int total = 100;
  int? currentPerPage = 10;
  List<bool>? expanded;
  String? searchKey = "id";
  XFile? imageFile;
  int currentPage = 1;
  bool isSearch = false;
  final List<Map<String, dynamic>> sourceOriginal = [];
  List<Map<String, dynamic>> sourceFiltered = [];
  List<Map<String, dynamic>> source = [];
  List<Map<String, dynamic>> selecteds = [];
  Uint8List webImage = Uint8List(8);

  // ignore: unused_field
  final String selectableKey = "id";
  String idType = "product";
  String? sortColumn;
  bool sortAscending = true;
  bool isLoading = true;
  final bool showSelect = true;
  File? pickImage;
  var random = Random();

  List<Map<String, dynamic>> _generateData({int n: 100}) {
    final List source = List.filled(n, Random.secure());
    List<Map<String, dynamic>> temps = [];
    var i = 1;
    if (kDebugMode) {
      print(i);
    }
    // ignore: unused_local_variable
    for (var data in source) {
      temps.add({
        "id": i + 1,
        "image": imageAssets.logo1,
        "name": "Product $i",
        "isActive": true,
        "action": i
      });
      i++;
    }
    return temps;
  }

  initializeData() async {
    mockPullData();
  }

  mockPullData() async {
    expanded = List.generate(currentPerPage!, (index) => false);

    isLoading = true;
    update();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      sourceOriginal.clear();
      sourceOriginal.addAll(_generateData(n: random.nextInt(10000)));
      sourceFiltered = sourceOriginal;
      total = sourceFiltered.length;
      source = sourceFiltered.getRange(0, currentPerPage!).toList();
      isLoading = false;
      update();
    });
  }

//add banner dialog
  addBannerDialog() async {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return const AddBanner();
          });
        });
  }

  resetData({start = 0}) async {
    isLoading = true;
    update();
    var expandedLen =
        total - start < currentPerPage! ? total - start : currentPerPage;
    Future.delayed(const Duration(seconds: 0)).then((value) {
      expanded = List.generate(expandedLen as int, (index) => false);
      source.clear();
      source = sourceFiltered.getRange(start, start + expandedLen).toList();
      isLoading = false;
      update();
    });
  }

  filterData(value) {
    isLoading = true;
    update();

    try {
      if (value == "" || value == null) {
        sourceFiltered = sourceOriginal;
      } else {
        sourceFiltered = sourceOriginal
            .where((data) => data[searchKey!]
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }

      total = sourceFiltered.length;
      var rangeTop = total < currentPerPage! ? total : currentPerPage!;
      expanded = List.generate(rangeTop, (index) => false);
      source = sourceFiltered.getRange(0, rangeTop).toList();
    } catch (e) {
      print(e);
    }
    isLoading = false;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    headers = [
      DatatableHeader(
          text: "ID",
          value: "id",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "Image",
          value: "image",
          show: true,
          sortable: false,
          sourceBuilder: (value, row) {
            return Image.asset(value, height: Sizes.s60);
          },
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "Name",
          value: "name",
          show: true,
          sortable: true,
          textAlign: TextAlign.left),
      DatatableHeader(
          text: "Is Active",
          value: "isActive",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "Received",
          value: "action",
          show: true,
          sortable: false,
          sourceBuilder: (value, row) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: OutlinedButton(
                          onPressed: () {
                            if (kDebugMode) {
                              print("caa : #$value");
                            }
                            if (kDebugMode) {
                              print("caa : #$row");
                            }
                          },
                          child: const Icon(Icons.edit, size: Sizes.s18))),
                  OutlinedButton(
                      onPressed: () {},
                      child: const Icon(Icons.delete, size: Sizes.s18))
                ]);
          },
          textAlign: TextAlign.center),
    ];

    initializeData();
    super.onReady();
  }

// GET IMAGE FROM GALLERY
  Future getImage(source, {StateSetter? setState}) async {
    final ImagePicker picker = ImagePicker();
    imageFile = (await picker.pickImage(source: source))!;
    if (kDebugMode) {
      print("imageFile : $imageFile");

      var image = await imageFile!.readAsBytes();
      webImage = image;
      pickImage = File(imageFile!.path);
      setState!(() {});
      print("pickImage : $pickImage");
      print("webImage : $webImage");
    }
  }

  //image picker option
  imagePickerOption(StateSetter? setState) {
    showModalBottomSheet(
        context: Get.context!,
        shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(AppRadius.r25)),
        ),
        builder: (BuildContext context) {
          // return your layout
          return Container(
            padding: const EdgeInsets.all(12),
            height: Sizes.s150,
            color: appCtrl.appTheme.whiteColor,
            alignment: Alignment.bottomCenter,
            child: Column(children: [
              const VSpace(Sizes.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconCreation(
                      icons: Icons.camera,
                      color: appCtrl.isTheme
                          ? appCtrl.appTheme.white
                          : appCtrl.appTheme.primary,
                      text: "camera",
                      onTap: () {
                        getImage(ImageSource.camera, setState: setState);
                        Get.back();
                      }),
                  IconCreation(
                      icons: Icons.image,
                      color: appCtrl.isTheme
                          ? appCtrl.appTheme.white
                          : appCtrl.appTheme.primary,
                      text: "gallery",
                      onTap: () {
                        getImage(ImageSource.gallery, setState: setState);
                        Get.back();
                      }),
                ],
              ),
            ]),
          );
        });
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

    return DataRow(cells: [
      DataCell(Text(data['image'].toString())
          .decorated(color: appCtrl.appTheme.gray)),
      DataCell(
          Text(data['no'].toString()).decorated(color: appCtrl.appTheme.gray)),
      DataCell(Text(data['item'].toString())),
      DataCell(Text(data['price'].toString())),
      DataCell(Text(data['date'].toString())),
      DataCell(Builder(builder: (context) {
        return Row(mainAxisSize: MainAxisSize.min, children: [
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
          )
        ]);
      }))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
