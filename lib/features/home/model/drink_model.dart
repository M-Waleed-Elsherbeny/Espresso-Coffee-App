class DrinkModel {
  final String name, description;
  final String imagePath;
  final double price;

  DrinkModel({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
  });

  static List<DrinkModel> drinks = [
    DrinkModel(
      imagePath: 'assets/images/drinks/Strawberry.png',
      name: 'Strawberry Coffee',
      description: 'A refreshing blend of strawberries and coffee',
      price: 49.99,
    ),
    DrinkModel(
      imagePath: 'assets/images/drinks/Chocolate.png',
      name: 'Chocolate Coffee',
      description: 'Rich and creamy chocolate coffee',
      price: 39.49,
    ),
    DrinkModel(
      name: 'Banana Coffee',
      imagePath: 'assets/images/drinks/Banana.png',
      description: 'Creamy and delicious banana coffee',
      price: 55.29,
    ),
    DrinkModel(
      name: 'Brownie Island Coffee',
      imagePath: 'assets/images/drinks/Brownie_Island.png',
      description: 'A rich and indulgent brownie island coffee',
      price: 29.99,
    ),
    DrinkModel(
      name: 'Carmel Coffee',
      imagePath: 'assets/images/drinks/carmel.png',
      description: 'A rich and creamy carmel coffee',
      price: 59.99,
    ),
    DrinkModel(
      name: 'Peanut Butter Coffee',
      imagePath: 'assets/images/drinks/Peanut_Butter.png',
      description: 'A rich and creamy peanut butter coffee',
      price: 34.99,
    ),
    DrinkModel(
      name: 'Salted Caramel Coffee',
      imagePath: 'assets/images/drinks/Salted_Caramel.png',
      description: 'A rich and creamy salted caramel coffee',
      price: 44.99,
    ),
  ];
}
