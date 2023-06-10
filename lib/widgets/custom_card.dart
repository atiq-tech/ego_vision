import 'package:flutter/material.dart';

class MyCustomCard extends StatelessWidget {
  // final Category data;
  final VoidCallback onTap;
  // final SvgPicture cardIcon;
  final Image cardIcon;
  final Text cardName;

  MyCustomCard(
      {required this.onTap, required this.cardIcon, required this.cardName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: EdgeInsets.only(right: 5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [cardIcon, cardName],
          ),
        ),
      ),
    );
  }
}
