import 'package:espersso_coffee_app/features/home/components/drink_items.dart';
import 'package:espersso_coffee_app/features/home/drinks_details.dart';
import 'package:espersso_coffee_app/features/home/model/drink_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
          child: Column(
            children: [
              SizedBox(height: 50),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: DrinkModel.drinks.length,
                  itemBuilder: (context, index) {
                    var drink = DrinkModel.drinks[index];
                    return AnimatedBuilder(
                      animation: scrollController,
                      builder: (context, child) {
                        double value = 0;
                        if (scrollController.hasClients) {
                          value = scrollController.offset / 100 - index;
                          value = value.clamp(0, 3);
                        }
                        return Transform.scale(
                          scale: 1 - (value * 0.2),
                          child: child,
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return DrinksDetails();
                          }));
                        },
                        child: DrinkItems(
                          drinkImage: drink.imagePath,
                          title: drink.name,
                          description: drink.description,
                          price: '${drink.price}',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
