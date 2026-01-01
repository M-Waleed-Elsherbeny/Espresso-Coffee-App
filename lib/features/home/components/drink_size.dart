import 'package:flutter/material.dart';

class DrinkSize extends StatelessWidget {
  const DrinkSize({super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;
  final Function(int) onTap;


  @override
  Widget build(BuildContext context) {
    return Padding(
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
                            onTap(index);
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: List.generate(4, (index) {
                    //     return Text(
                    //       sizes[index],
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.normal,
                    //       ),
                    //     );
                    //   }),
                    // ),
                  ],
                ),
              );
  }
}
