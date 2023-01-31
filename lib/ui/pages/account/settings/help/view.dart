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

  double webProgress = 0.05;

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
        body: Column(
          children: [
            webProgress < 1
                ? SizedBox(
                    height: 2,
                    child: LinearProgressIndicator(
                      value: webProgress,
                      color: !context.isDarkMode ? Colors.black : Colors.white,
                      backgroundColor: !context.isDarkMode && isLoading
                          ? Colors.black.withOpacity(0.1)
                          : Colors.white.withOpacity(0.1),
                    ),
                  )
                : const SizedBox(),
            isLoading
                ? Expanded(
                    child: Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          color:
                              !context.isDarkMode ? Colors.black : Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: Uri.encodeFull(helpPageUrl),
                      backgroundColor:
                          !context.isDarkMode ? Colors.white : Colors.black,
                      zoomEnabled: false,
                      onProgress: (progress) => setState(() {
                        webProgress = progress / 100;
                      }),
                      onPageFinished: (finish) => setState(() {
                        isLoading = false;
                      }),
                      onWebViewCreated: (controller) {
                        this.controller = controller;
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
