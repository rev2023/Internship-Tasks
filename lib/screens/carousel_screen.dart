import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/styles/app_colors.dart';
import 'package:counter_app/router/app_router.gr.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {

  final double cardHeight = 200;
  final double cardWidth = 200;
  final int totalNumbers = 16;
  final double margin = 20;
  List<Widget> list = [];

  @override
  void initState() {
    super.initState();
    list = List<Widget>.generate(totalNumbers, (index) {
      return GestureDetector(
        onTap: () {context.router.push(FactRoute(count: index));},

        child: Container(
          margin:  EdgeInsets.all(margin),
          height: cardHeight,
          width: cardWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColors.cardColor,
          ),
          child: Center(
            child: Text('$index', style: const TextStyle(fontSize: 150)),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children:list
            ),
          ),
        );
      },
    );
  }
}
