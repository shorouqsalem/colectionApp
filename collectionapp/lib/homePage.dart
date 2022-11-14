// ignore_for_file: unnecessary_this, file_names, non_constant_identifier_names


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController controler;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          WebView(
            initialUrl: "https://www.facebook.com/",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              this.controler = controller;
            },
            onPageStarted: (Url) {
              //بعد 1000 ميلي من الثانية رح يبدا اللود
              Future.delayed(const Duration(milliseconds: 1000), () {
                //اما رح يختفي الد الا لما الصفحةكاملة تتحمل

                setState(() {
                  isLoading = false;
                });
              });
            },
            onPageFinished: (url) {
              //hiden the header and fooater in my page
              controler.runJavascript(
                  "document.getElementsByTagName('header')[0].style.display='none'");
              controler.runJavascript(
                  "document.getElementsByTagName('footer')[0].style.display='none'");
            },
          ),
          if (isLoading)
            const Center(
                child: SizedBox(
                    width: 70, height: 70, child: CircularProgressIndicator()))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controler.loadUrl("https://www.youtube.com/");
        },
        child: const Icon(Icons.video_call_outlined),
      ),
    );
  }
}
