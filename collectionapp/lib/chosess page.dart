// ignore_for_file: file_names, unnecessary_this, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class Mycollection extends StatefulWidget {
  const Mycollection({super.key});

  @override
  State<Mycollection> createState() => _MycollectionState();
}

class _MycollectionState extends State<Mycollection> {
  late WebViewController controler;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controler.loadUrl("https://www.bing.com/search?q=جامعةالبلقاء+التطبيقية&cvid=c83d43c58a8a46ef843691bf481f64ed&aqs=edge.7.69i59i450l8...8.93227j0j1&FORM=ANNTA1&PC=U531");
        },
        child: const Icon(Icons.video_call_outlined),
      ),
      body: SafeArea(
        
        child: Stack(
          children: [
            

            WebView(
              initialUrl: "https://www.google.ae/",
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
            // if (isLoading)
            //   const Center(
            //       child: SizedBox(
            //           width: 70,
            //           height: 70,
            //           child: CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}
