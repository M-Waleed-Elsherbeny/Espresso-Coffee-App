import 'package:flutter/material.dart';

class DrinkItems extends StatelessWidget {
  const DrinkItems({
    super.key,
    required this.drinkImage,
    required this.title,
    required this.description,
    required this.price,
  });
  final String drinkImage, title, description, price;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Card(
            elevation: 4,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Row(),
            ),
          ),
        ),
        Positioned(
          top: -10,
          left: 10,
          bottom: 40,
          child: Stack(
            alignment: AlignmentGeometry.bottomCenter,
            children: [
              Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade900,
                      spreadRadius: 2,
                      blurRadius: 30,
                    ),
                  ],
                ),
              ),
              Image.asset(drinkImage, fit: BoxFit.contain),
            ],
          ),
        ),
        Positioned(
          top: 25,
          right: 70,
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 200,
                child: Text(description, style: TextStyle()),
              ),
              SizedBox(height: 5),
              Text(
                price,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 35,
          right: 20,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black12),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black54,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
