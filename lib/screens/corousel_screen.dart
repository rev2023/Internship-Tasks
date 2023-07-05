import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          enlargeCenterPage: true,
          viewportFraction: 1.0, // Set to 1.0 to display one item at a time
        ),
        items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.width - 150,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Center(
                        child: Text(
                          '$i',
                          style: const TextStyle(fontSize: 160.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 150,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(15, (index) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == i - 1 ? Colors.amber : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ],
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
