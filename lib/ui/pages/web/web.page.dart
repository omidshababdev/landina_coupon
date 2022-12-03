import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "صفحه اینترنت",
          rightIcon: CupertinoIcons.share,
          rightIconOnPressed: () {},
          leftIcon: Icons.close,
          leftIconOnPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: Uri.encodeFull("https://omidshabab.com"),
      ),
    );
  }
}
