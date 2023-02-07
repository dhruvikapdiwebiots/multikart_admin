import 'package:flutter/foundation.dart';

import 'package:responsive_table/responsive_table.dart';

import '../../../config.dart';

class BannerList extends StatelessWidget {
  const BannerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (bannerCtrl) {
      return bannerCtrl.headers!.isNotEmpty
          ? ResponsiveDatatable(
              title: TextButton.icon(
                  onPressed: () => bannerCtrl.addBannerDialog(),
                  icon: const Icon(Icons.add),
                  label: Text(fonts.signIn.tr)),
              reponseScreenSizes: const [ScreenSize.xs],
              actions: const [BannerSearchAction()],
              headers:
                  bannerCtrl.headers!.isNotEmpty ? bannerCtrl.headers! : [],
              source: bannerCtrl.source,
              selecteds: bannerCtrl.selected,
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
              onSort: (value)=> bannerCtrl.onSort(value),
              expanded: bannerCtrl.expanded,
              sortAscending: bannerCtrl.sortAscending,
              sortColumn: bannerCtrl.sortColumn,
              isLoading: bannerCtrl.isLoading,
              onSelect: (value, item) {
                if (kDebugMode) {
                  print("$value  $item ");
                }
                if (value!) {
                  bannerCtrl.selected.add(item);
                  bannerCtrl.update();
                } else {
                  bannerCtrl.selected
                      .removeAt(bannerCtrl.selected.indexOf(item));
                  bannerCtrl.update();
                }
              },
              onSelectAll: (value) {
                if (value!) {
                  bannerCtrl.selected =
                      bannerCtrl.source.map((entry) => entry).toList().cast();
                  bannerCtrl.update();
                } else {
                  bannerCtrl.selected.clear();
                  bannerCtrl.update();
                }
              },
              footers: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: Insets.i15),
                    child: Text(fonts.rowPerPage.tr)),
                if (bannerCtrl.perPages.isNotEmpty) const PageDropDown(),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: Insets.i15),
                    child: Text(
                        "${bannerCtrl.currentPage} - ${bannerCtrl.currentPerPage} of ${bannerCtrl.total}")),
                const ArrowBack(),
                const ArrowForward()
              ],
              headerDecoration: BannerCommonClass().headerDecoration(),
              selectedDecoration: BannerCommonClass().selectedDecoration(),
              headerTextStyle: TextStyle(color: appCtrl.appTheme.whiteColor),
              rowTextStyle: TextStyle(color: appCtrl.appTheme.greenColor),
              selectedTextStyle: TextStyle(color: appCtrl.appTheme.whiteColor),
            )
          : Container();
    });
  }
}
