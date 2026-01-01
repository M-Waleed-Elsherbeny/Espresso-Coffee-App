import 'package:espersso_coffee_app/features/home/components/animated_drink_image.dart';
import 'package:espersso_coffee_app/features/home/components/drink_details.dart';
import 'package:espersso_coffee_app/features/home/components/drink_size.dart';
import 'package:espersso_coffee_app/features/home/components/drinks_qty.dart';
import 'package:espersso_coffee_app/features/home/model/drink_model.dart';
import 'package:flutter/material.dart';

class DrinksDetails extends StatefulWidget {
  const DrinksDetails({super.key});

  @override
  State<DrinksDetails> createState() => _DrinksDetailsState();
}

class _DrinksDetailsState extends State<DrinksDetails> {
  /// Animation
  PageController pageController = PageController(viewportFraction: 0.50);
  double currentPage = 0;

  /// accessing drink model
  List<DrinkModel> drinks = DrinkModel.drinks;

  /// logic
  int currentIndex = 0;
  List<String> sizes = ['Small', 'Medium', 'Large', 'More'];

  bool isCold = false;
  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page ?? 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            DrinkDetails(drinks: drinks, currentPage: currentPage),
            AnimatedDrinkImage(
              pageController: pageController,
              drinks: drinks,
              currentPage: currentPage,
            ),
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: DrinkSize(
                currentIndex: currentIndex,
                onTap: (currentIndex) {
                  setState(() {
                    this.currentIndex = currentIndex;
                  });
                },
              ),
            ),

            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        buildSwitchToggle('Hot', !isCold),
                        buildSwitchToggle('Cold', isCold),
                      ],
                    ),
                  ),
                  Spacer(),
                  DrinksQty(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwitchToggle(label, isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCold = label == 'Cold';
        });
      },
      child: AnimatedContainer(
        curve: Curves.linearToEaseOut,
        duration: Duration(seconds: 1),
        child: Container(
          width: 100,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
