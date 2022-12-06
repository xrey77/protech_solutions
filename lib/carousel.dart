import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<String> imgList = [
    "assets/images/x1.png",
    "assets/images/x2.png",
    "assets/images/x3.png",
    "assets/images/x4.png"
  ];

  @override
  Widget build(BuildContext context) => Column(
        children: [
          CarouselSlider.builder(
            itemCount: imgList.length,
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            itemBuilder: (context, index, realIdx) {
              return Center(
                  child: Image.asset(imgList[index],
                      fit: BoxFit.cover, width: 1000));
            },
          )
        ],
      );
}
