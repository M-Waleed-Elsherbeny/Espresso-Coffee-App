import 'package:espersso_coffee_app/features/home/model/drink_model.dart';
import 'package:flutter/material.dart';

class DrinkDetails extends StatelessWidget {
  const DrinkDetails({
    super.key,
    required this.drinks,
    required this.currentPage,
  });
  final List<DrinkModel> drinks;
  final double currentPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  drinks[currentPage.toInt()].name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  drinks[currentPage.toInt()].description,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'EGP ${drinks[currentPage.toInt()].price}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
