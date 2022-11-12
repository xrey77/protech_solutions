import 'dart:async';

import 'package:flutter/material.dart';

class Sliders extends StatefulWidget {
  const Sliders({Key? key}) : super(key: key);

  @override
  State<Sliders> createState() => _State();
}

class _State extends State<Sliders> {
  int activePage = 1;
  int currentPage = 0;
// ignore: prefer_typing_uninitialized_variables
  var pageController;

  List<String> carousel = [
    "assets/images/x1.png",
    "assets/images/x2.png",
    "assets/images/x3.png",
    "assets/images/x4.png"
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPage < 3) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: const Duration(microseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (page) {
        setState(() {
          activePage = page;
        });
      },
      itemCount: carousel.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      pageSnapping: true,
      controller: pageController,
      itemBuilder: (context, currentPage) {
        return Container(
          color: Colors.black,
          margin: const EdgeInsets.only(left: 5, top: 5, right: 0, bottom: 0),
          // child: Tooltip(
          //   message: 'SCROLL IMAGE TO THE LEFT',
          //   textStyle: const TextStyle(fontSize: 20, color: Colors.white),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(carousel[currentPage], fit: BoxFit.fill),
          ),

          // ),
        );
      },
    );
  }
}
