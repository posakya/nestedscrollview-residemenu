import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent, width: 0.1),
            borderRadius: BorderRadius.circular(15.0)),
        elevation: 4,
        margin: EdgeInsets.only(top: 105, right: 15, left: 15),
        child: CarouselSlider(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          scrollDirection: Axis.horizontal,
          viewportFraction: 1.1,
          pauseAutoPlayOnTouch: Duration(seconds: 3),
          height: 200.0,
          items: [
            AssetImage('images/dari.jpg'),
            AssetImage('images/n.jpg'),
            AssetImage('images/s.jpg'),
            AssetImage('images/n.jpg'),
            AssetImage('images/n.jpg')
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(),
                    child: Center(
                        child: Container(
                            child: Image(
                                fit: BoxFit.cover,
                                height: double.infinity,
                                width: double.infinity,
                                image: i))));
              },
            );
          }).toList(),
        ));
  }
}