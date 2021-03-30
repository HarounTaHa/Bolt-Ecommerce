import 'package:boltecommerceapp/Utility/config.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class AddressUser extends StatefulWidget {
  @override
  _AddressUserState createState() => _AddressUserState();
}

class _AddressUserState extends State<AddressUser> {
  String latitudeData = "";
  String longitudeData = "";
  String _address;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    final geoPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitudeData = '${geoPosition.latitude}';
      longitudeData = '${geoPosition.longitude}';
      getAddressBasedOnLocation(geoPosition.latitude, geoPosition.longitude);
    });
  }

  getAddressBasedOnLocation(double lat, double lng) async {
    final coordinates = new Coordinates(lat, lng);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    print("********************$addresses");
    setState(() {
      _address = addresses.first.addressLine;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        child: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.safeBlockVertical * 6,
              right: 8,
              left: SizeConfig.safeBlockHorizontal * 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_sharp,
                    size: 38,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 5,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 4),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Address',
                        style: TextStyle(fontSize: 34),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 3,
                          right: SizeConfig.safeBlockHorizontal * 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text(
                          //   '$latitudeData,$longitudeData',
                          //   style: TextStyle(fontSize: 15),
                          // ),
                          Expanded(
                            child: Text(
                              _address != null
                                  ? _address
                                  : "Not supported area",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),

                          Icon(
                            Icons.cancel_outlined,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.safeBlockVertical * 67,
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Container(
                          width: SizeConfig.screenWidth - 100,
                          height: SizeConfig.safeBlockVertical * 6,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            onPressed: () {},
                            textColor: Colors.white,
                            color: Colors.blue[500],
                            child: Text(
                              'Add To Payment',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ]),
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

  convertCoordinatesToAddress(Coordinates coordinate) async {
    var address = await Geocoder.local.findAddressesFromCoordinates(coordinate);
    return address.first;
  }
}
