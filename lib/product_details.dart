import 'package:boltecommerceapp/Utility/config.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Model/product.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool checkBoxValue = false;
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.safeBlockVertical * 2.4,
                  top: SizeConfig.safeBlockVertical * 5.4,
                  right: SizeConfig.blockSizeHorizontal * 5.4),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.keyboard_backspace,
                          size: 35,
                        ),
                        Icon(
                          Icons.shopping_cart,
                          size: 35,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.5),
                          child: Image.asset(
                            '${product.imageUrl}',
                            fit: BoxFit.cover,
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.safeBlockVertical * 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3.5,
                    ),
                    Text(
                      '${product.name}',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${product.price}',
                          style:
                              TextStyle(fontSize: 22, color: Colors.blue[400]),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 3,
                        ),
                        Stack(
                          children: [
                            Text('\$ 65'),
                            Center(
                              child: Divider(
                                color: Colors.red,
                                height: 0.5,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Checkbox(
                            value: checkBoxValue,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue = value;
                              });
                            }),
                        Text('Add to favorite'),
                      ],
                    ),
                    Divider(
                      color: Colors.black87,
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.5),
                          child: Container(
                            height: SizeConfig.safeBlockVertical * 5,
                            width: SizeConfig.safeBlockHorizontal * 15,
                            color: Colors.blue[600],
                            child: Center(
                              child: Text(
                                '4.5',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 4,
                        ),
                        Text(
                          'Very Good',
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Text(
                          '25 Reviews ',
                          style:
                              TextStyle(fontSize: 18, color: Colors.blue[400]),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black87,
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(fontSize: 22),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, right: 8),
                      child: ExpandableText('${product.description}',
                          style: TextStyle(fontSize: 16),
                          expandText: 'More',
                          collapseText: 'Show less'),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 1,
                    ),
                    Divider(
                      color: Colors.black87,
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Select Size',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 5,
                        ),
                        Text(
                          'Select Color',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black87,
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selected == 0)
                                _selected = 1;
                              else
                                _selected = 0;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              color: _selected == 0
                                  ? Colors.grey[100]
                                  : Colors.blue,
                              height: SizeConfig.safeBlockVertical * 7.5,
                              width: SizeConfig.safeBlockHorizontal * 14,
                              child: Center(
                                child: Text(
                                  'S',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: _selected == 0
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 3.5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.grey[100],
                            height: SizeConfig.safeBlockVertical * 7.5,
                            width: SizeConfig.safeBlockHorizontal * 14,
                            child: Center(
                              child: Text(
                                'M',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 3.5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.grey[100],
                            height: SizeConfig.safeBlockVertical * 7.5,
                            width: SizeConfig.safeBlockHorizontal * 14,
                            child: Center(
                              child: Text(
                                'L',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 3.5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.grey[100],
                            height: SizeConfig.safeBlockVertical * 7.5,
                            width: SizeConfig.safeBlockHorizontal * 14,
                            child: Center(
                              child: Text(
                                'XXL',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 5,
            ),
            Container(
              width: SizeConfig.screenWidth,
              child: RaisedButton(
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                onPressed: () {},
                elevation: 2,
                color: Colors.blue[400],
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
