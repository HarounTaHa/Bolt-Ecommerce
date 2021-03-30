import 'package:boltecommerceapp/Model/product.dart';
import 'package:boltecommerceapp/Utility/config.dart';
import 'package:flutter/material.dart';

class CartItemDesign extends StatefulWidget {
  Product item;
  CartItemDesign(this.item);

  @override
  _CartItemDesignState createState() => _CartItemDesignState();
}

class _CartItemDesignState extends State<CartItemDesign> {
  int count = 1;
  double price = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    price = double.parse(widget.item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              elevation: 8,
              child: Image.asset(
                '${widget.item.imageUrl}',
                fit: BoxFit.cover,
                height: SizeConfig.safeBlockVertical * 15,
                width: SizeConfig.safeBlockHorizontal * 25,
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 1.5,
                ),
                Text('${widget.item.name}'),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2.5,
                ),
                Text(
                  '\$ ${(price * count).toStringAsFixed(2)}',
                  style: TextStyle(color: Color.fromRGBO(55, 74, 190, 1)),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                Card(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              count = count > 1 ? count - 1 : count;
                            });
                          },
                          child: Icon(
                            Icons.remove,
                            size: SizeConfig.safeBlockHorizontal * 5.4,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 4,
                        ),
                        Text(
                          '$count',
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              count = count < 5 ? count + 1 : count;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            size: SizeConfig.safeBlockHorizontal * 4.4,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: SizeConfig.safeBlockHorizontal * 24.9,
              height: SizeConfig.safeBlockVertical * 17,
              child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.cancel_outlined,
                      size: 21,
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
