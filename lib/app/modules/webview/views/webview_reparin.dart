import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/webview_controller.dart';

class HelpWebViewReparin extends GetView<ArticleDetailController> {
  const HelpWebViewReparin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reparin"),
      ),
      body: WebViewWidget(
        controller: controller.loadHelpPage2(),
      ),
    );
  }
}
