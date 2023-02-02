import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/common/theme/app_css.dart';
import 'package:multikart_admin/controllers/pages_controller/banner_controller.dart';
import 'package:multikart_admin/extensions/spacing.dart';
import 'package:multikart_admin/extensions/widget_extension.dart';
import 'package:multikart_admin/widgets/common_button.dart';
import 'package:multikart_admin/widgets/common_text_box.dart';
import 'package:responsive_table/responsive_table.dart';

import '../../config.dart';
import '../../responsive.dart';

class BannerPage extends StatelessWidget {
  final bannerCtrl = Get.put(BannerController());

  BannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lstLandInfo = [
      {"tite"},
      {"dsfsd"},
      {"Sdfsdf"}
    ];
    return GetBuilder<BannerController>(builder: (_) {
      /*  return DataTable(
            decoration: BoxDecoration(

                border: Border.all(color:Colors.white,width:2),
                borderRadius: BorderRadius.circular(16)
            ),
            onSelectAll: (b) {},
            //sortColumnIndex: 1,
            sortAscending: true,
            columnSpacing: 12,
            horizontalMargin: 0,
            //headingRowColor: MaterialStateColor.resolveWith((states) {return ColorUtils.greenlabelColor;},),
            dataRowColor: MaterialStateColor.resolveWith((states) {return Colors.white;},),
            headingRowHeight: 30,
            columns: <DataColumn>[
              DataColumn(
                label: Text("Khasra No.", textAlign: TextAlign.center),
                numeric: false,
                // onSort: (i, b) {
                //   print("$i $b");
                //   setState(() {
                //     //names.sort((a, b) => a.firstName.compareTo(b.firstName));
                //   });
                // },
                tooltip: "To display Khasra No",
              ),
              DataColumn(
                label: Text("Plot No.", textAlign: TextAlign.center,),
                numeric: false,
                // onSort: (i, b) {
                //   //print("$i $b");
                //   setState(() {
                //     //names.sort((a, b) => a.lastName.compareTo(b.lastName));
                //   });
                // },
                tooltip: "To display Plot No",
              ),
              DataColumn(
                label: Text("Area (In ha).", textAlign: TextAlign.center,),
                numeric: false,
                onSort: (i, b) {
                  //print("$i $b");
                },
                tooltip: "To display Plot No",
              ),
            ],
            rows: lstLandInfo
                .map(
                  (name) => DataRow(
                cells: [
                  DataCell(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("name.khasrano"),
                        Text('Latitude:'),
                      ],
                    ),
                    showEditIcon: false,
                    placeholder: false,
                  ),
                  DataCell(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("name.plotno"),
                        Text('0.23587'),
                      ],
                    ),
                    showEditIcon: false,
                    placeholder: false,
                  ),
                  DataCell(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("name.area"),
                        Text('Longitude:' + " 0.25845"),
                      ],
                    ),
                    showEditIcon: false,
                    placeholder: false,
                  )
                ],
              ),
            )
                .toList());*/
      return DataPage();
    });
  }
}

class DataPage extends StatefulWidget {
  DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late List<DatatableHeader> _headers;

  List<int> _perPages = [10, 20, 50, 100];
  int _total = 100;
  int? _currentPerPage = 10;
  List<bool>? _expanded;
  String? _searchKey = "id";
  XFile? imageFile;
  int _currentPage = 1;
  bool _isSearch = false;
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];

  // ignore: unused_field
  String _selectableKey = "id";

  String? _sortColumn;
  bool _sortAscending = true;
  bool _isLoading = true;
  bool _showSelect = true;
  var random = new Random();

  List<Map<String, dynamic>> _generateData({int n: 100}) {
    final List source = List.filled(n, Random.secure());
    List<Map<String, dynamic>> temps = [];
    var i = 1;
    print(i);
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

  _initializeData() async {
    _mockPullData();
  }

  _mockPullData() async {
    _expanded = List.generate(_currentPerPage!, (index) => false);

    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      _sourceOriginal.clear();
      _sourceOriginal.addAll(_generateData(n: random.nextInt(10000)));
      _sourceFiltered = _sourceOriginal;
      _total = _sourceFiltered.length;
      _source = _sourceFiltered.getRange(0, _currentPerPage!).toList();
      setState(() => _isLoading = false);
    });
  }

  _resetData({start = 0}) async {
    setState(() => _isLoading = true);
    var _expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(const Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoading = false);
    });
  }

  _filterData(value) {
    setState(() => _isLoading = true);

    try {
      if (value == "" || value == null) {
        _sourceFiltered = _sourceOriginal;
      } else {
        _sourceFiltered = _sourceOriginal
            .where((data) => data[_searchKey!]
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }

      _total = _sourceFiltered.length;
      var _rangeTop = _total < _currentPerPage! ? _total : _currentPerPage!;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      print(e);
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    /// set headers
    _headers = [
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
                      print("caa : #$value");
                      print("caa : #$row");
                    },
                    child: const Icon(
                      Icons.edit,
                      size: Sizes.s18,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.delete,
                    size: Sizes.s18,
                  ),
                ),
              ],
            );
          },
          textAlign: TextAlign.center),
    ];

    _initializeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(0),
            constraints: const BoxConstraints(
              maxHeight: 700,
            ),
            child: Card(
              elevation: 1,
              shadowColor: Colors.black,
              clipBehavior: Clip.none,
              child: ResponsiveDatatable(
                title: TextButton.icon(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "Add Banner",
                        radius: AppRadius.r10,
                        content: Column(children: [
                          const CommonTextBox(
                            hinText: "Name",
                          ),
                          const VSpace(Sizes.s15),
                          Row(children: [
                            const Icon(Icons.add)
                                .paddingAll(Insets.i10)
                                .decorated(
                                    color: appCtrl.appTheme.primary,
                                    borderRadius:
                                        BorderRadius.circular(AppRadius.r10))
                                .inkWell(onTap: () => imagePickerOption()),
                            const HSpace(Sizes.s5),
                            const Text("Add Image")
                          ])
                        ]));
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("new item"),
                ),
                reponseScreenSizes: [ScreenSize.xs],
                actions: [
                  if (_isSearch)
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter search term based on ' +
                              _searchKey!
                                  .replaceAll(new RegExp('[\\W_]+'), ' ')
                                  .toUpperCase(),
                          prefixIcon: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () {
                                setState(() {
                                  _isSearch = false;
                                });
                                _initializeData();
                              }),
                          suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {})),
                      onSubmitted: (value) {
                        _filterData(value);
                      },
                    )),
                  if (!_isSearch)
                    IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            _isSearch = true;
                          });
                        })
                ],
                headers: _headers,
                source: _source,
                selecteds: _selecteds,
                autoHeight: false,
                onChangedRow: (value, header) {
                  /// print(value);
                  /// print(header);
                },
                onSubmittedRow: (value, header) {
                  /// print(value);
                  /// print(header);
                },
                onTabRow: (data) {
                  print(" dhfgdf : $data");
                },
                onSort: (value) {
                  setState(() => _isLoading = true);

                  setState(() {
                    _sortColumn = value;
                    _sortAscending = !_sortAscending;
                    if (_sortAscending) {
                      _sourceFiltered.sort((a, b) =>
                          b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                    } else {
                      _sourceFiltered.sort((a, b) =>
                          a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                    }
                    var _rangeTop = _currentPerPage! < _sourceFiltered.length
                        ? _currentPerPage!
                        : _sourceFiltered.length;
                    _source = _sourceFiltered.getRange(0, _rangeTop).toList();
                    _searchKey = value;

                    _isLoading = false;
                  });
                },
                expanded: _expanded,
                sortAscending: _sortAscending,
                sortColumn: _sortColumn,
                isLoading: _isLoading,
                onSelect: (value, item) {
                  print("$value  $item ");
                  if (value!) {
                    setState(() => _selecteds.add(item));
                  } else {
                    setState(
                        () => _selecteds.removeAt(_selecteds.indexOf(item)));
                  }
                },
                onSelectAll: (value) {
                  if (value!) {
                    setState(() => _selecteds =
                        _source.map((entry) => entry).toList().cast());
                  } else {
                    setState(() => _selecteds.clear());
                  }
                },
                footers: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Text("Rows per page:"),
                  ),
                  if (_perPages.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButton<int>(
                        value: _currentPerPage,
                        items: _perPages
                            .map((e) => DropdownMenuItem<int>(
                                  child: Text("$e"),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (dynamic value) {
                          setState(() {
                            _currentPerPage = value;
                            _currentPage = 1;
                            _resetData();
                          });
                        },
                        isExpanded: false,
                      ),
                    ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child:
                          Text("$_currentPage - $_currentPerPage of $_total")),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 16),
                    onPressed: _currentPage == 1
                        ? null
                        : () {
                            var _nextSet = _currentPage - _currentPerPage!;
                            setState(() {
                              _currentPage = _nextSet > 1 ? _nextSet : 1;
                              _resetData(start: _currentPage - 1);
                            });
                          },
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 16),
                    onPressed: _currentPage + _currentPerPage! - 1 > _total
                        ? null
                        : () {
                            var _nextSet = _currentPage + _currentPerPage!;

                            setState(() {
                              _currentPage = _nextSet < _total
                                  ? _nextSet
                                  : _total - _currentPerPage!;
                              _resetData(start: _nextSet - 1);
                            });
                          },
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  )
                ],
                headerDecoration: const BoxDecoration(
                    color: Colors.grey,
                    border: Border(
                        bottom: BorderSide(color: Colors.red, width: 1))),
                selectedDecoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.green[300]!, width: 1)),
                  color: Colors.green,
                ),
                headerTextStyle: const TextStyle(color: Colors.white),
                rowTextStyle: const TextStyle(color: Colors.green),
                selectedTextStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ]));
  }

// GET IMAGE FROM GALLERY
  Future getImage(source) async {
    final ImagePicker picker = ImagePicker();
    imageFile = (await picker.pickImage(source: source))!;
    print("imageFile : $imageFile");
  }

  //image picker option
  imagePickerOption() {
    showModalBottomSheet(
        context: context,
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
                        getImage(ImageSource.camera);
                        Get.back();
                      }),
                  IconCreation(
                      icons: Icons.image,
                      color: appCtrl.isTheme
                          ? appCtrl.appTheme.white
                          : appCtrl.appTheme.primary,
                      text: "gallery",
                      onTap: () {

                        getImage(ImageSource.camera);
                        Get.back();
                      }),
                ],
              ),
            ]),
          );
        });
  }
}

class IconCreation extends StatelessWidget {
  final IconData? icons;
  final Color? color;
  final String? text;
  final GestureTapCallback? onTap;

  const IconCreation({Key? key, this.text, this.color, this.icons, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: AppRadius.r30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: Sizes.s30,
              color: appCtrl.appTheme.whiteColor,
            ),
          ),
          const VSpace(Sizes.s8),
          Text(
            text!,
            style: AppCss.nunitoblack14.textColor(appCtrl.appTheme.blackColor),
          )
        ],
      ),
    );
  }
}
