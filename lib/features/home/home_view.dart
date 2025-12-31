import 'package:espersso_coffee_app/features/home/components/drink_items.dart';
import 'package:espersso_coffee_app/features/home/model/drink_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                  itemCount: DrinkModel.drinks.length,
                  itemBuilder: (context, index) {
                    var drink = DrinkModel.drinks[index];
                    return DrinkItems(
                      drinkImage: drink.imagePath,
                      title: drink.name,
                      description: drink.description,
                      price: '${drink.price}',
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
