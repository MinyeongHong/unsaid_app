import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/firebase.dart';
import 'package:unsaid_app/core/widget/loading.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:unsaid_app/core/widget/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  final String url;
  final bool isCookie;

  const WebViewPage({
    super.key,
    this.title = '',
    required this.url,
    this.isCookie = false,
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late Uri _uri;
  late WebViewController _webViewController;

  bool _isLoading = true;

  @override
  void initState() {
    analyticsLogEvent(
      'web_view_open',
      parameters: {
        'title': widget.title,
      },
    );

    _uri = Uri.parse(widget.url);

    _setCookie();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
        ),
      )
      ..loadRequest(_uri);
    super.initState();
  }

  void _setCookie() async {
    try {
      if (!widget.isCookie) return;

      final String? idToken = await firebaseAuth.currentUser!.getIdToken();

      final WebViewCookie webViewCookie = WebViewCookie(
        name: 'api_access_token',
        value: idToken!,
        domain: _uri.host,
      );

      WebViewCookieManager().setCookie(webViewCookie);
    } catch (e) {
      errorToast(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      onTapAppBar: () async {
        final bool canGoBack = await _webViewController.canGoBack();

        if (canGoBack) {
          _webViewController.goBack();
        } else {
          Navigator.of(context).pop();
        }
      },
      title: widget.title,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          WebViewWidget(
            controller: _webViewController,
            gestureRecognizers: Set()
              ..add(
                Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer(),
                ),
              ),
          ),
          Positioned(
            top: 20,
            child: _isLoading ? CustomLoading() : Container(),
          ),
        ],
      ),
    );
  }
}
