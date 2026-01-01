import 'package:espersso_coffee_app/features/home/model/drink_model.dart';
import 'package:flutter/material.dart';

class AnimatedDrinkImage extends StatelessWidget {
  const AnimatedDrinkImage({
    super.key,
    required this.pageController,
    required this.drinks,
    required this.currentPage,
  });
  final PageController pageController;
  final List<DrinkModel> drinks;
  final double currentPage;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: pageController,
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        final scale = 1 - (currentPage - index).abs() * 1;
        final translateY = (currentPage - index).abs() * 400;
        return Transform.translate(
          offset: Offset(translateY, 0),
          child: Transform.scale(
            scale: scale.clamp(0.5, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      drinks[index].imagePath,
                      height: 700,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      bottom: 130,
                      right: 0,
                      left: 0,
                      child: Container(
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              spreadRadius: 2,
                              blurRadius: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
