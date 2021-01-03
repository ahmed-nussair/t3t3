import 'package:flutter/material.dart';
import 'package:t3t3/view/ui/screen_util.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MerchantsAddressAndLocation extends StatefulWidget {
  @override
  _MerchantsAddressAndLocationState createState() =>
      _MerchantsAddressAndLocationState();
}

class _MerchantsAddressAndLocationState
    extends State<MerchantsAddressAndLocation> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return ListView(
      children: [
        Padding(
            padding: EdgeInsets.only(
                right: _screenUtil.setWidth(30),
                left: _screenUtil.setWidth(30),
                top: _screenUtil.setWidth(20),
                bottom: _screenUtil.setWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Specify Your Business Address:',
                  style: TextStyle(
                    fontSize: _screenUtil.setSp(40),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: _screenUtil.setHeight(50),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: _screenUtil.setHeight(150),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius:
                        BorderRadius.circular(_screenUtil.setWidth(50)),
                  ),
                  child: Text(
                    'From Your Addresses List',
                    style: TextStyle(
                      fontSize: _screenUtil.setSp(40),
                    ),
                  ),
                ),
                SizedBox(
                  height: _screenUtil.setHeight(50),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: _screenUtil.setHeight(150),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius:
                        BorderRadius.circular(_screenUtil.setWidth(50)),
                  ),
                  child: Text(
                    'Add A New Address',
                    style: TextStyle(
                      fontSize: _screenUtil.setSp(40),
                    ),
                  ),
                ),
              ],
            )),
        Divider(),
        Padding(
            padding: EdgeInsets.only(
                right: _screenUtil.setWidth(30),
                left: _screenUtil.setWidth(30),
                top: _screenUtil.setWidth(20),
                bottom: _screenUtil.setWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Specify Your Business Location:',
                  style: TextStyle(
                    fontSize: _screenUtil.setSp(40),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: _screenUtil.setHeight(50),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: _screenUtil.setHeight(150),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius:
                        BorderRadius.circular(_screenUtil.setWidth(50)),
                  ),
                  child: Text(
                    'Open The Map to Specify Your Business Location',
                    style: TextStyle(
                      fontSize: _screenUtil.setSp(40),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
