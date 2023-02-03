import 'package:multikart_admin/config.dart';

class ActionLayout extends StatelessWidget {
  const ActionLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Responsive.isMobile(context) || Responsive.isTablet(context)
            ? MaterialButton(
                height: double.infinity,
                minWidth: 60,
                hoverColor: Colors.transparent,
                onPressed: () {},
                child: const Icon(Icons.search))
            : Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: 180,
                height: 48,
                child: TextField(
                    cursorWidth: 1,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        hoverColor: Colors.transparent,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none),
                        filled: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: Insets.i15),
                        hintText: "Search",
                        hintStyle: const TextStyle(fontSize: 15),
                        suffixIcon: const Icon(Icons.search),
                        // fillColor: Colors.textFieldBG,
                        isCollapsed: true)))
      ],
    );
  }
}
