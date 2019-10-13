import 'package:flutter/material.dart';
import 'package:olm/style.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int color;

  ProductCard({this.imageUrl, this.name, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.0,
      ),
      child: Container(
        width: 165.0,
        height: 240.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 5.0,
                  right: 5.0,
                  bottom: 20.0,
                ),
                child: Container(
                  width: 140,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 10.0),
                        blurRadius: 12,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: -12,
              top: -5,
              child: Image.asset(imageUrl),
              width: 170.0,
              height: 150.0,
            ),
            Positioned(
              left: 30,
              bottom: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name, style: productTitleStyle),
                  Text("Color $color", style: productSubTitleStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
