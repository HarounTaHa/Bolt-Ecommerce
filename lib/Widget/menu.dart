import 'package:flutter/material.dart';

class MenuDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Color(0xff424242),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            child: Container(
              width: 25.9,
              height: 3.0,
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Card(
            color: Color(0xff212121),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            child: Container(
              width: 16.4,
              height: 3.0,
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Card(
            color: Color(0xff424242),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            child: Container(
              width: 20.9,
              height: 3.0,
            ),
          ),
        ],
      ),
    );
  }
}
