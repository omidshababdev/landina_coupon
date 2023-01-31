import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final String helpPageUrl = "https://landina.co/help";

  late WebViewController controller;

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: LandinaAppbar(
            title: 'راهنمایی',
            rightIcon: Ionicons.reorder_two,
            rightIconOnPressed: () {},
            leftIcon: IconlyLight.arrow_left,
            leftIconOnPressed: () {
              Get.back();
            },
          ),
        ),
        body: Stack(
          children: [
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: Uri.encodeFull(helpPageUrl),
              backgroundColor:
                  !context.isDarkMode ? Colors.white : Colors.black,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
              zoomEnabled: false,
              onWebViewCreated: (controller) {
                this.controller = controller;
              },
            ),
            isLoading
                ? Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(
                        color:
                            !context.isDarkMode ? Colors.black : Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
