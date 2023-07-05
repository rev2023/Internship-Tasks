import 'package:flutter/material.dart';
import 'package:counter_app/styles/app_colors.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  late PageController pageController;
  int count = 0;
  final double dotHeight = 10;
  final double dotWidth = 10;
  final int totalNumbers = 16;


  @override
  void initState() {
    pageController = PageController(initialPage: 1, viewportFraction: 0.84);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: [
            const SizedBox(height: 200,),
            Center(
              child: SizedBox(
                height: 250,
                child: PageView.builder(
                  itemCount: totalNumbers,
                  onPageChanged: (index){
                    setState(() {
                      count = index;

                    });
                  },
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                      animation: pageController,
                      builder: (context, child) {
                        return child!;
                      },
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.amber,
                          ),
                          child: Center(
                            child: Text('$index', style: const TextStyle(fontSize: 150)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(totalNumbers, (index) {
                return SizedBox(
                  height: 150,
                  child: Container(
                    width: dotHeight,
                    height: dotWidth,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == count ? AppColors.cardColor : AppColors.nonActiveDotColor,
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
