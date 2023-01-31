import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final String aboutPageUrl = "https://landina.co/about";

  late WebViewController controller;

  bool isLoading = true;

  double webProgress = 0.05;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "درباره اپلیکیشن",
          rightIcon: Ionicons.reorder_two,
          rightIconOnPressed: () {},
          leftIcon: IconlyLight.arrow_left,
          leftIconOnPressed: () {
            Navigator.pop(context);
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
                    initialUrl: Uri.encodeFull(aboutPageUrl),
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
    );
  }
}
