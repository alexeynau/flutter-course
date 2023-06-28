import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  late InAppWebViewController _webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );

  @override
  void initState() {
    super.initState();
    // _localhostServer.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _controller,
              ),
              Container(
                height: 1000,
                child: InAppWebView(
                  onWebViewCreated: (controller) {
                    _webViewController = controller;
                  },
                  initialOptions: options,
                  initialUrlRequest: URLRequest(
                    url: Uri.parse("http://inappwebview.dev/"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _loadUrl(_controller.text);
        },
      ),
    );
  }

  void _loadUrl(String url) {
    _webViewController.loadUrl(
      urlRequest: URLRequest(
        url: Uri.parse(url),
      ),
    );
  }
}
