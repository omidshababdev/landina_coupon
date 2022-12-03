import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final String webpageUrl = "https://omidshabab.com";
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: GestureDetector(
          onTap: () async {
            if (await canLaunchUrlString(webpageUrl)) {
              await launchUrlString(
                webpageUrl,
                mode: LaunchMode.externalApplication,
              );
            }
          },
          child: LandinaAppbar(
            title: "omidshabab.com",
            rightIcon: CupertinoIcons.share,
            rightIconOnPressed: () {
              Share.share("This is your link: $webpageUrl");
            },
            leftIcon: Icons.close,
            leftIconOnPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: Uri.encodeFull(webpageUrl),
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
      ),
    );
  }
}
