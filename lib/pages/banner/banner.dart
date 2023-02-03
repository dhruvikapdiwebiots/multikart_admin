import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multikart_admin/controllers/pages_controller/banner_controller.dart';
import 'package:responsive_table/responsive_table.dart';

import '../../config.dart';

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
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context, StateSetter setState) {

                                  return AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    content: SizedBox(
                                      width: Sizes.s400,
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: <Widget>[
                                          Column(

                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Container(
                                                height: Sizes.s50,
                                                width: Sizes.s400,
                                                decoration: BoxDecoration(
                                                    color:
                                                    appCtrl.appTheme.whiteColor,
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            color: appCtrl
                                                                .appTheme.gray
                                                                .withOpacity(0.3)))),
                                                child: const Center(
                                                    child: Text("Add Banner",
                                                        style: TextStyle(
                                                            color: Colors.black54,
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontSize: 20,
                                                            fontStyle:
                                                            FontStyle.italic,
                                                            fontFamily:
                                                            "Helvetica"))),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    const CommonTextBox(
                                                      hinText: "Name",
                                                    ),
                                                    const VSpace(Sizes.s15),
                                                    const CommonTextBox(
                                                      hinText: "Product Id",
                                                    ),
                                                    const VSpace(Sizes.s15),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Expanded(
                                                          child: RadioListTile(
                                                            contentPadding: EdgeInsets.zero,
                                                            title: Text("Product"),
                                                            value: "product",
                                                            dense: true,
                                                            visualDensity: VisualDensity(horizontal: 0),
                                                            groupValue:bannerCtrl.idType,
                                                            activeColor: appCtrl
                                                                .appTheme.primary,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                bannerCtrl.idType = value!;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: RadioListTile(
                                                            contentPadding: EdgeInsets.zero,
                                                            title: Text("Collection"),
                                                            dense: true,
                                                            visualDensity: VisualDensity(horizontal: 0),
                                                            value: "collection",
                                                            groupValue: bannerCtrl.idType,
                                                            activeColor: appCtrl
                                                                .appTheme.primary,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                bannerCtrl.idType = value!;
                                                              });
                                                            },
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              bannerCtrl.pickImage == null
                                                  ? DottedBorder(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: Sizes.s15,
                                                    vertical: Insets.i10),
                                                color: appCtrl.appTheme.gray
                                                    .withOpacity(.5),
                                                radius: const Radius.circular(
                                                    AppRadius.r5),
                                                dashPattern: const [8, 10],
                                                strokeWidth: 1.5,
                                                strokeCap: StrokeCap.round,
                                                borderType: BorderType.RRect,
                                                child: Row(children: const [
                                                  Icon(Icons.image),
                                                  HSpace(Sizes.s10),
                                                  Text("Add Image")
                                                ]),
                                              )
                                                  .paddingSymmetric(
                                                  horizontal: Insets.i20)
                                                  .inkWell(onTap: () {
                                                if (kIsWeb) {
                                                  bannerCtrl.getImage(ImageSource.gallery,
                                                      setState: setState);
                                                }else{
                                                  bannerCtrl.imagePickerOption(setState);
                                                }
                                              })
                                                  : kIsWeb
                                                  ? DottedBorder(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: Sizes.s15,
                                                      vertical: Insets.i10),
                                                  color: appCtrl.appTheme.gray
                                                      .withOpacity(.5),
                                                  radius:
                                                  const Radius.circular(
                                                      AppRadius.r5),
                                                  dashPattern: const [8, 10],
                                                  strokeWidth: 1.5,
                                                  strokeCap: StrokeCap.round,
                                                  borderType:
                                                  BorderType.RRect,
                                                  child:
                                                  bannerCtrl.imageFile!.name.contains("png") ?  Image.memory(bannerCtrl.webImage,fit: BoxFit.fill,) : SvgPicture.memory(bannerCtrl.webImage)).inkWell(onTap: ()=> bannerCtrl.getImage(ImageSource.gallery,setState:setState))
                                                  :  DottedBorder(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: Sizes.s15,
                                                      vertical: Insets.i10),
                                                  color: appCtrl.appTheme.gray
                                                      .withOpacity(.5),
                                                  radius:
                                                  const Radius.circular(
                                                      AppRadius.r5),
                                                  dashPattern: const [8, 10],
                                                  strokeWidth: 1.5,
                                                  strokeCap: StrokeCap.round,
                                                  borderType:
                                                  BorderType.RRect,child: Image.file(bannerCtrl.pickImage!,fit: BoxFit.fill,height: Sizes.s100,)).inkWell(onTap: ()=>  bannerCtrl.imagePickerOption(setState)),
                                              const VSpace(Sizes.s25),
                                              CommonButton(
                                                title: "Submit",
                                                style: AppCss.nunitoblack14.textColor(
                                                    appCtrl.appTheme.white),
                                              ),
                                              const VSpace(Sizes.s15)
                                            ],
                                          ),
                                          Positioned(
                                            right: 15.0,
                                            top: 15.0,
                                            child: InkResponse(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: CircleAvatar(
                                                radius: 12,
                                                backgroundColor:
                                                appCtrl.appTheme.primary,
                                                child: Icon(
                                                  Icons.close,
                                                  size: 18,
                                                  color: appCtrl.appTheme.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              });
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("new item"),
                      ),
                      reponseScreenSizes: const [ScreenSize.xs],
                      actions: [
                        if (bannerCtrl.isSearch)
                          Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText:
                                    'Enter search term based on ${bannerCtrl.searchKey!.replaceAll(RegExp('[\\W_]+'), ' ').toUpperCase()}',
                                    prefixIcon: IconButton(
                                        icon: const Icon(Icons.cancel),
                                        onPressed: () {
                                            bannerCtrl.isSearch = false;
                                          bannerCtrl.initializeData();
                                          bannerCtrl.update();
                                        }),
                                    suffixIcon: IconButton(
                                        icon: const Icon(Icons.search),
                                        onPressed: () {})),
                                onSubmitted: (value) {
                                  bannerCtrl.filterData(value);
                                },
                              )),
                        if (!bannerCtrl.isSearch)
                          IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {
                                  bannerCtrl.isSearch = true;
                                  bannerCtrl.update();
                              })
                      ],
                      headers: bannerCtrl.headers,
                      source: bannerCtrl.source,
                      selecteds: bannerCtrl.selecteds,
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
                        if (kDebugMode) {
                          print(" dhfgdf : $data");
                        }
                      },
                      onSort: (value) {
                        bannerCtrl.isLoading = true;
                        bannerCtrl.update();

                          bannerCtrl.sortColumn = value;
                          bannerCtrl.sortAscending = !bannerCtrl.sortAscending;
                          if (bannerCtrl.sortAscending) {
                            bannerCtrl.sourceFiltered.sort((a, b) =>
                                b["${bannerCtrl.sortColumn}"].compareTo(a["${bannerCtrl.sortColumn}"]));
                          } else {
                            bannerCtrl.sourceFiltered.sort((a, b) =>
                                a["${bannerCtrl.sortColumn}"].compareTo(b["${bannerCtrl.sortColumn}"]));
                          }
                          var rangeTop = bannerCtrl.currentPerPage! < bannerCtrl.sourceFiltered.length
                              ? bannerCtrl.currentPerPage!
                              : bannerCtrl.sourceFiltered.length;
                          bannerCtrl.source = bannerCtrl.sourceFiltered.getRange(0, rangeTop).toList();
                          bannerCtrl.searchKey = value;

                          bannerCtrl.isLoading = false;
                        bannerCtrl.update();
                      },
                      expanded: bannerCtrl.expanded,
                      sortAscending: bannerCtrl.sortAscending,
                      sortColumn: bannerCtrl.sortColumn,
                      isLoading: bannerCtrl.isLoading,
                      onSelect: (value, item) {
                        if (kDebugMode) {
                          print("$value  $item ");
                        }
                        if (value!) {
                           bannerCtrl.selecteds.add(item);
                           bannerCtrl.update();
                        } else {
                          bannerCtrl.selecteds.removeAt(bannerCtrl.selecteds.indexOf(item));
                          bannerCtrl.update();
                        }
                      },
                      onSelectAll: (value) {
                        if (value!) {
                          bannerCtrl.selecteds =
                              bannerCtrl.source.map((entry) => entry).toList().cast();
                          bannerCtrl.update();
                        } else {
                           bannerCtrl.selecteds.clear();
                           bannerCtrl.update();
                        }
                      },
                      footers: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: const Text("Rows per page:"),
                        ),
                        if (bannerCtrl.perPages.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: DropdownButton<int>(
                              value: bannerCtrl.currentPerPage,
                              items: bannerCtrl.perPages
                                  .map((e) => DropdownMenuItem<int>(
                                value: e,
                                child: Text("$e"),
                              ))
                                  .toList(),
                              onChanged: (dynamic value) {
                                  bannerCtrl.currentPerPage = value;
                                  bannerCtrl.currentPage = 1;
                                  bannerCtrl.resetData();
                                  bannerCtrl.update();
                              },
                              isExpanded: false,
                            ),
                          ),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child:
                            Text("${bannerCtrl.currentPage} - ${bannerCtrl.currentPerPage} of ${bannerCtrl.total}")),
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios, size: 16),
                          onPressed: bannerCtrl.currentPage == 1
                              ? null
                              : () {
                            var nextSet = bannerCtrl.currentPage - bannerCtrl.currentPerPage!;
                              bannerCtrl.currentPage = nextSet > 1 ? nextSet : 1;
                              bannerCtrl.resetData(start: bannerCtrl.currentPage - 1);
                              bannerCtrl.update();
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios, size: 16),
                          onPressed: bannerCtrl.currentPage + bannerCtrl.currentPerPage! - 1 > bannerCtrl.total
                              ? null
                              : () {
                            var nextSet = bannerCtrl.currentPage + bannerCtrl.currentPerPage!;
                              bannerCtrl.currentPage = nextSet < bannerCtrl.total
                                  ? nextSet
                                  : bannerCtrl.total - bannerCtrl.currentPerPage!;
                              bannerCtrl.resetData(start: nextSet - 1);
                            bannerCtrl.update();
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                        )
                      ],
                      headerDecoration: BoxDecoration(
                          color: appCtrl.appTheme.gray,
                          border: const Border(
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
    });
  }
}


