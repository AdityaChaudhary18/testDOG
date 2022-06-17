import 'package:flutter/material.dart';

class scrollableNumberBar extends StatelessWidget {
  scrollableNumberBar({
    required this.selected,
    required this.fun,
  });

  final int selected;
  final Function fun;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: RotatedBox(
        quarterTurns: -1,
        child: ListWheelScrollView(
          onSelectedItemChanged: (x) {
            fun(x);
          },
          itemExtent: 50,
          children: List.generate(
            9,
            (index) => RotatedBox(
              quarterTurns: 1,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                width: 50,
                curve: Curves.bounceOut,
                height: index == selected ? 55 : 50,
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                      fontSize: index == selected
                          ? 50
                          : index == selected + 1
                              ? 30
                              : 20,
                      color:
                          index == selected ? Colors.deepPurple : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          diameterRatio: 0.8,
          magnification: 0.5,
        ),
      ),
    );
  }
}
