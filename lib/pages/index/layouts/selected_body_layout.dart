import '../../../config.dart';

class SelectedIndexBodyLayout extends StatelessWidget {
  const SelectedIndexBodyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (indexCtrl) {
      return Expanded(
          child: SelectionArea(
              child: CustomScrollView(
                  controller: indexCtrl.scrollController,
                  slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (Responsive.isDesktop(context))
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const VSpace(Sizes.s20),
                                Text(indexCtrl.pageName.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(fontWeight: FontWeight.bold)),
                                const VSpace(Sizes.s8),
                                Row(children: [
                                  const InkWell(
                                      mouseCursor: SystemMouseCursors.click,
                                      child: Text("Admin")),
                                  const Text('  /  '),
                                  Text(indexCtrl.pageName.tr)
                                ])
                              ]),
                        const VSpace(Sizes.s20),
                        indexCtrl.widgetOptions
                            .elementAt(indexCtrl.selectedIndex)
                      ]))
            ])),
            SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: Column(children: const <Widget>[
                  Expanded(child: SizedBox.shrink())
                ]))
          ])));
    });
  }
}
