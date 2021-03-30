import 'package:boltecommerceapp/Utility/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Widget/cart_item.dart';
import 'address_screen.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final List _listCart = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Stack(children: [
        Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.safeBlockVertical * 8,
              right: SizeConfig.safeBlockHorizontal * 5,
              left: SizeConfig.safeBlockHorizontal * 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.keyboard_backspace_outlined,
                      size: 35,
                    ),
                    Icon(
                      Icons.favorite_border,
                      size: 35,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                Container(
                  height: SizeConfig.screenHeight - 170,
                  child: ListView.builder(
                      itemCount: _listCart.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: false,
                      itemBuilder: (context, index) {
                        return CartItemDesign(_listCart[index]);
                      }),
                )
              ],
            )),
        Positioned(
          top: SizeConfig.safeBlockVertical * 92,
          left: SizeConfig.safeBlockHorizontal * 7.5,
          child: Container(
            width: SizeConfig.screenWidth - 60,
            height: SizeConfig.safeBlockVertical * 8,
            child: RaisedButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddressUser()));
              },
              child: Text(
                'ADD ADDRESS',
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
