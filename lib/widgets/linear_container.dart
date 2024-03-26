import 'package:flutter/material.dart';

class GradientContainerWithColumn extends StatelessWidget {
  final List<Widget> columnChildren;

  const GradientContainerWithColumn({super.key, required this.columnChildren});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 319.0,
        height: 172.0,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF083BF2), Color(0xff1678EB)],
              // Using the color code 083BF2
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(22.0))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: columnChildren,
          ),
        ),
      ),
    );
  }
}
