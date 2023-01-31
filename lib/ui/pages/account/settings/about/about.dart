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
      body: Stack(
        children: [
          WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: Uri.encodeFull(aboutPageUrl),
            backgroundColor: !context.isDarkMode ? Colors.white : Colors.black,
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
                      color: !context.isDarkMode ? Colors.black : Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
