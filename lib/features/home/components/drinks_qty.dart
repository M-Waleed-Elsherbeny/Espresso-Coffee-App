import 'package:flutter/material.dart';

class DrinksQty extends StatefulWidget {
  const DrinksQty({super.key});

  @override
  State<DrinksQty> createState() => _DrinksQtyState();
}

class _DrinksQtyState extends State<DrinksQty> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              alignment: Alignment.center,
              color: Colors.black45,
              padding: EdgeInsets.zero,
              iconSize: 30,
              onPressed: () {
                setState(() {
                  qty-- == 1 ? qty = 1 : qty--;
                });
              },
              icon: Icon(Icons.remove),
            ),
            Text(
              qty.toString(),
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            IconButton(
              alignment: Alignment.center,
              color: Colors.black45,
              padding: EdgeInsets.zero,
              iconSize: 30,
              onPressed: () {
                setState(() {
                  qty++;
                });
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
