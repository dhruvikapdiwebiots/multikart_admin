import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:developer' as log;
import 'package:flutter/foundation.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/widgets/helper_function.dart';
import 'package:responsive_table/responsive_table.dart';

import '../../config.dart';
import '../../widgets/icon_creation.dart';

class BannerController extends GetxController {
  List<DatatableHeader>? headers;
  late DropzoneViewController? controller1;
  final List<int> perPages = [10, 20, 50, 100];
  int total = 100;
  int? currentPerPage = 10;
  List<bool>? expanded;
  String? searchKey = "id";
  XFile? imageFile;
  int currentPage = 1;
  bool isSearch = false, isUploadSize = false;
  final List<Map<String, dynamic>> sourceOriginal = [];
  List<Map<String, dynamic>> sourceFiltered = [];
  List<Map<String, dynamic>> source = [];
  List<Map<String, dynamic>> selected = [];
  String imageName = "";
  Uint8List webImage = Uint8List(8);

  // ignore: unused_field
  final String selectableKey = "id";
  String idType = "product";
  String? sortColumn;
  Uint8List uploadWebImage = Uint8List(8);

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


  //list data
  mockPullData() async {
    expanded = List.generate(currentPerPage!, (index) => false);

    isLoading = true;

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

  //reset data
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

  //filter data
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
      log.log("filter error : $e");
    }
    isLoading = false;
    update();
  }

  //on click Image
  onImagePickUp(setState) {
    if (kIsWeb) {
      getImage(source: ImageSource.gallery);
    } else {
      imagePickerOption(
          setState: setState,
          cameraTap: () {
            getImage(
                source: ImageSource.camera, setState: setState);
            Get.back();
          },
          galleryTap: () {
            getImage(
                source: ImageSource.gallery, setState: setState);
            Get.back();
          });
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
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
    update();
    initializeData();

    super.onInit();
  }

// GET IMAGE FROM GALLERY
  Future getImage({source, StateSetter? setState, dropImage}) async {
    if (kDebugMode) {
      if (dropImage != null) {
        if (imageName.contains("png") ||
            imageName.contains("jpg") ||
            imageName.contains("jpeg")) {
          var image = dropImage;
          uploadWebImage = image;
          Image image1 = Image.memory(uploadWebImage);

          ImageInfo info = await getImageInfo(image1);

          if (info.image.width > 300 && info.image.height > 50) {
            webImage = uploadWebImage;
            pickImage = File("a");
            isUploadSize = false;
          } else {
            isUploadSize = true;
          }
        } else {
          ScaffoldMessenger.of(Get.context!)
              .showSnackBar(const SnackBar(content: Text("No Svg Allow")));
        }
      } else {
        final ImagePicker picker = ImagePicker();
        imageFile = (await picker.pickImage(source: source))!;
        print("imageFile : $imageFile");

        if (imageFile!.name.contains("png") ||
            imageFile!.name.contains("jpg") ||
            imageFile!.name.contains("jpeg")) {
          var image = await imageFile!.readAsBytes();
          uploadWebImage = image;

          Image image1 = Image.memory(uploadWebImage);

          ImageInfo info = await getImageInfo(image1);

          if (info.image.width > 300 && info.image.height > 50) {
            webImage = uploadWebImage;
            pickImage = File(imageFile!.path);
            isUploadSize = false;
          } else {
            isUploadSize = true;
          }

          update();
        } else {
          ScaffoldMessenger.of(Get.context!)
              .showSnackBar(const SnackBar(content: Text("No Svg Allow")));
        }
      }
    }
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
              child: const Text("crudDetail"),
            ),
          ),
          OutlinedButton(
            onPressed: () => onDeleteButtonPressed.call(data),
            child: const Text("crudDelete"),
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
