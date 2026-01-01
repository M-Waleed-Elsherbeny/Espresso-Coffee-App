import 'package:espersso_coffee_app/features/home/components/animated_drink_image.dart';
import 'package:espersso_coffee_app/features/home/components/drink_details.dart';
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: Container(
                            width: currentIndex == index ? 50 : 30,
                            height: currentIndex == index ? 50 : 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentIndex == index
                                  ? Colors.amber.shade800
                                  : Colors.white,
                              border: Border.all(color: Colors.black45),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.check,
                              color: currentIndex == index
                                  ? Colors.white
                                  : Colors.black45,
                              size: currentIndex == index ? 40 : 20,
                            ),
                          ),
                        );
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                        return Text(
                          sizes[index],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Container(
                width: 100,
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    buildSwitchToggle('Hot', !isCold),
                    buildSwitchToggle('Cold', isCold),
                  ],
                ),
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
        margin: EdgeInsets.symmetric(horizontal: 15),
        duration: Duration(seconds: 1),
        child: Container(
          width: 100,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
