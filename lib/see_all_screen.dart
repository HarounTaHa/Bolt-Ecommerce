import 'package:boltecommerceapp/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Utility/config.dart';

class SeeAllScreen extends StatefulWidget {
  String nameScreen;

  SeeAllScreen(this.nameScreen);

  @override
  _SeeAllScreenState createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  @override
  Widget build(BuildContext context) {
    final List _list = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.safeBlockVertical * 1,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.safeBlockVertical * 2.4,
                    top: SizeConfig.safeBlockVertical * 5.4,
                    right: SizeConfig.blockSizeHorizontal * 5.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 35,
                    ),
                    Spacer(),
                    Icon(
                      Icons.search,
                      size: 35,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 35,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.safeBlockVertical * 3.8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.nameScreen}",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: SizeConfig.blockSizeVertical * 4.5),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return DesignProduct(index, _list);
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: SizeConfig.screenWidth /
                              (SizeConfig.screenHeight / 1.4),
                          crossAxisCount: 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DesignProduct extends StatelessWidget {
  int index;
  List _list;
  DesignProduct(this.index, this._list);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetails(),
                  settings: RouteSettings(arguments: _list[index])));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.2),
              child: SizedBox(
                height: SizeConfig.safeBlockVertical * 25,
                child: Image.asset(
                  '${_list[index].imageUrl}',
                  fit: BoxFit.cover,
                  width: SizeConfig.safeBlockHorizontal * 40,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 1,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 1),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '\$ ${_list[index].price}',
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 1,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('${_list[index].name}')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
