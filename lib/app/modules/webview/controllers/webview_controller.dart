import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailController extends GetxController {
  WebViewController loadHelpPage1() {
    const helpUrl = 'https://www.ifixit.com';
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(helpUrl));
  }
    WebViewController loadHelpPage2() {
    const helpUrl = 'https://reparin.xyz';
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(helpUrl));
  }
}
