import 'package:flutter/material.dart';

import 'package:olm/models/model.dart';
import 'package:olm/widgets/product_card.dart';
import 'package:olm/custom_icons.dart';
import 'package:olm/style.dart';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf3f6fb),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 30.0,
                bottom: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(CustomIcon.menu),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(CustomIcon.cart),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                "Shop",
                style: headingStyle,
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Container(
              width: double.infinity,
              height: 60.0,
              margin: EdgeInsets.symmetric(
                horizontal: 22.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    offset: Offset(0, 10.0),
                    blurRadius: 30.0,
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 18.0,
                    right: 12.0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search...",
                      hintStyle: searchBarStyle,
                      suffixIcon: Icon(CustomIcon.search),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25.0,
              ),
              child: Text(
                "Headphones",
                style: headingStyle,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              height: 240.0,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var product = products[index];

                  return ProductCard(
                    imageUrl: product.image,
                    name: product.title,
                    color: product.color,
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 160.0,
              margin: EdgeInsets.symmetric(horizontal: 22.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Speakers",
                      style: speakerTitleStyle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        bottom: 10.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 6.0),
                              blurRadius: 6,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 22.0,
                            top: 10.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Ralis",
                                style: productTitleStyle,
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                "Haute Red, Slate Blue, \nMist Grey",
                                style: speakerDescStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -15,
                    top: -15,
                    child: Image.asset('assets/images/speakers.png'),
                    width: 125.0,
                    height: 150.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 12.0),
        child: BubbleBottomBar(
          backgroundColor: Colors.transparent,
          opacity: 1.0,
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: changePage,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(CustomIcon.home, color: Colors.black),
              activeIcon: Icon(CustomIcon.home, color: Colors.white),
              title: Text("Home", style: bottomBarItemStyle),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(CustomIcon.dahboard, color: Colors.black),
              activeIcon: Icon(CustomIcon.dahboard, color: Colors.white),
              title: Text("My Ads", style: bottomBarItemStyle),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(CustomIcon.favicon, color: Colors.black),
              activeIcon: Icon(CustomIcon.favicon, color: Colors.white),
              title: Text("History", style: bottomBarItemStyle),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(CustomIcon.profile, color: Colors.black),
              activeIcon: Icon(CustomIcon.profile, color: Colors.white),
              title: Text("Profile", style: bottomBarItemStyle),
            ),
          ],
        ),
      ),
    );
  }
}
