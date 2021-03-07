import 'dart:math';

import 'package:boltecommerceapp/Model/category.dart';
import 'package:flutter/material.dart';

import 'Utility/config.dart';
import 'Widget/menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  List _list = categories;

  List _category = [
    categories[0].name,
    categories[1].name,
    categories[2].name,
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 7.4),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // app bar

                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.safeBlockVertical * 5.4,
                      right: SizeConfig.blockSizeHorizontal * 4.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuDesign(),
                      Spacer(),
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 35,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.favorite_border,
                        size: 35,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 4),
                //Search Bar
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 13.5,
                    width: SizeConfig.screenWidth,
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.safeBlockHorizontal * 1.6)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 16, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              VerticalDivider(
                                color: Colors.grey[400],
                                width: 29,
                                indent: 8,
                                endIndent: 8,
                              ),
                              Text(
                                "Search Your Product",
                                style: TextStyle(
                                    color: Colors.grey[500], fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //Categories

                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4.6,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 2,
                      right: SizeConfig.safeBlockHorizontal * 6.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                            letterSpacing: 0.2,
                            color: Colors.black,
                            fontSize: SizeConfig.safeBlockHorizontal * 5),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            letterSpacing: 0.2,
                            color: Colors.black54,
                            fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 10.5,
                  width: SizeConfig.screenWidth,
                  child: ListView.builder(
                    itemCount: _category.length,
                    controller: null,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            right: SizeConfig.safeBlockHorizontal * 1),
                        width: SizeConfig.safeBlockHorizontal * 33,
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 2,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(3.5),
                                  child: Image.asset(
                                    '${_list[index].imageUrl}',
                                    fit: BoxFit.fitHeight,
                                    width: SizeConfig.screenWidth,
                                    height: SizeConfig.screenHeight,
                                    semanticLabel: 'Category',
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(3.5),
                                  child: Container(
                                    color: Color.fromRGBO(
                                        Random().nextInt(255),
                                        Random().nextInt(255),
                                        Random().nextInt(255),
                                        0.7),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '${_list[index].name}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

//                Featured
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4.6,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 2,
                      right: SizeConfig.safeBlockHorizontal * 6.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured',
                        style: TextStyle(
                            letterSpacing: 0.2,
                            color: Colors.black,
                            fontSize: SizeConfig.safeBlockHorizontal * 5),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            letterSpacing: 0.2,
                            color: Colors.black54,
                            fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
