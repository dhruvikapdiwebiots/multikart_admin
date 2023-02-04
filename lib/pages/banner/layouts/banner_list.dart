import 'package:flutter/foundation.dart';
import 'package:multikart_admin/controllers/pages_controller/banner_controller.dart';
import 'package:multikart_admin/pages/banner/layouts/arrow_back.dart';
import 'package:multikart_admin/pages/banner/layouts/arrow_forward.dart';
import 'package:multikart_admin/pages/banner/layouts/pages_banner_drop_down.dart';
import 'package:responsive_table/responsive_table.dart';

import '../../../config.dart';
import 'banner_search_action.dart';

class BannerList extends StatelessWidget {
  const BannerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (bannerCtrl) {
      return ResponsiveDatatable(
        title: TextButton.icon(
          onPressed: () => bannerCtrl.addBannerDialog(),
          icon: const Icon(Icons.add),
          label:  Text(fonts.signIn.tr),
        ),
        reponseScreenSizes: const [ScreenSize.xs],
        actions: const [BannerSearchAction()],
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
                b["${bannerCtrl.sortColumn}"]
                    .compareTo(a["${bannerCtrl.sortColumn}"]));
          } else {
            bannerCtrl.sourceFiltered.sort((a, b) =>
                a["${bannerCtrl.sortColumn}"]
                    .compareTo(b["${bannerCtrl.sortColumn}"]));
          }
          var rangeTop =
              bannerCtrl.currentPerPage! < bannerCtrl.sourceFiltered.length
                  ? bannerCtrl.currentPerPage!
                  : bannerCtrl.sourceFiltered.length;
          bannerCtrl.source =
              bannerCtrl.sourceFiltered.getRange(0, rangeTop).toList();
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
              padding: const EdgeInsets.symmetric(horizontal: Insets.i15),
              child:  Text(fonts.rowPerPage.tr)),
          if (bannerCtrl.perPages.isNotEmpty) const PageDropDown(),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: Insets.i15),
              child: Text(
                  "${bannerCtrl.currentPage} - ${bannerCtrl.currentPerPage} of ${bannerCtrl.total}")),
          const ArrowBack(),
          const ArrowForward()
        ],
        headerDecoration: BoxDecoration(
            color: appCtrl.appTheme.gray,
            border:
                 Border(bottom: BorderSide(color: appCtrl.appTheme.redColor, width: 1))),
        selectedDecoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: appCtrl.appTheme.greenColor.withOpacity(.3), width: 1)),
            color: appCtrl.appTheme.greenColor),
        headerTextStyle:  TextStyle(color: appCtrl.appTheme.whiteColor),
        rowTextStyle:  TextStyle(color: appCtrl.appTheme.greenColor),
        selectedTextStyle:  TextStyle(color: appCtrl.appTheme.whiteColor),
      );
    });
  }
}
