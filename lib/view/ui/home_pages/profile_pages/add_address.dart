import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'country_list.dart';
import 'location_map.dart';
import '../../screen_util.dart';
import 'package:toast/toast.dart';

import '../../custom_show_dialog.dart';

class AddAddress extends StatefulWidget {
  final Function(Map<String, String>) onAddressAdded;

  AddAddress({@required this.onAddressAdded});

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final ScreenUtil _screenUtil = ScreenUtil();

  final TextEditingController _line1Controller = TextEditingController();
  final TextEditingController _line2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _poController = TextEditingController();

  String _country;

  double _latitude;
  double _longitude;

  @override
  void initState() {
    _country = '';
    _latitude = 0.0;
    _longitude = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.setWidth(1000),
      height: _screenUtil.setHeight(2000),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(ScreenUtil().setWidth(50)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ScreenUtil().setWidth(50)),
                topRight: Radius.circular(ScreenUtil().setWidth(50)),
              ),
              color: Color(0xff9b7448),
            ),
            child: Text(
              'Add New Address',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(50),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                  child: _formField('Address Line 1', null,
                      controller: _line1Controller,
                      inputType: TextInputType.multiline,
                      maxLines: 5),
                ),
                Padding(
                  padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                  child: _formField('Address Line 2', null,
                      controller: _line2Controller,
                      inputType: TextInputType.multiline,
                      maxLines: 5),
                ),
                Padding(
                  padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: _formField(
                          'City',
                          null,
                          controller: _cityController,
                        ),
                      ),
                      SizedBox(
                        width: _screenUtil.setWidth(30),
                      ),
                      Flexible(
                        flex: 1,
                        child: _formField(
                          'State',
                          null,
                          controller: _stateController,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomAlertDialog(
                            titlePadding: EdgeInsets.all(0.0),
                            contentPadding: EdgeInsets.all(0.0),
                            content: CountryList(
                              onCountryCodeSelected: (country) {
                                setState(() {
                                  _country = country;
                                });
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: _screenUtil.setWidth(800),
                      height: _screenUtil.setHeight(120),
                      padding: EdgeInsets.all(_screenUtil.setHeight(25)),
                      decoration: BoxDecoration(
                        color: Color(0xfff4f4f8),
                        borderRadius: BorderRadius.all(
                            Radius.circular(_screenUtil.setWidth(30))),
                      ),
                      child: Text(
                        _country.isNotEmpty ? _country : 'Country',
                        style: TextStyle(
                          fontSize: _screenUtil.setSp(40),
                          color: Color(0xffd8cfcc),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                  child: _formField('ZIP / Postal Code', null,
                      controller: _poController,
                      inputType: TextInputType.numberWithOptions(
                          decimal: false, signed: false)),
                ),
                Padding(
                  padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                  child: GestureDetector(
                    onTap: () async {
                      if (_line1Controller.text.isEmpty) {
                        Toast.show(
                            "Specify the address first (Fill at least the line 1 of the address",
                            context,
                            duration: Toast.LENGTH_LONG,
                            gravity: Toast.BOTTOM);
                        return;
                      }

                      Position position = await Geolocator.getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.high);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LocationMap(
                                address:
                                    '${_line1Controller.text}\n${_line2Controller.text}',
                                latitude: position.latitude,
                                longitude: position.longitude,
                                onLocationSpecifiedOnMap: (lat, lon) {
                                  setState(() {
                                    _latitude = lat;
                                    _longitude = lon;
                                  });
                                  print('Latitude: $_latitude');
                                  print('Longitude: $_longitude');
                                },
                                editing: true,
                              )));
                    },
                    child: Container(
                      height: _screenUtil.setHeight(100),
                      decoration: BoxDecoration(
                        color: Color(0xfff4f4f8),
                        borderRadius:
                            BorderRadius.circular(_screenUtil.setWidth(30)),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _latitude > 0 && _longitude > 0
                            ? '$_latitude, $_longitude'
                            : 'Specify Address Location',
                        style: TextStyle(
                          fontSize: _latitude > 0 && _longitude > 0
                              ? _screenUtil.setSp(37)
                              : _screenUtil.setSp(50),
                          color: _latitude > 0 && _longitude > 0
                              ? Colors.black
                              : Color(0xffd9d9d9),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: ElevatedButton(
                          // color: Color(0xff9b7448),
                          onPressed: () {
                            Map<String, String> data = {
                              'firstLine': _line1Controller.text,
                              'secondLine': _line2Controller.text,
                              'city': _cityController.text,
                              'state': _stateController.text,
                              'country': _country,
                              'zipPostalCode': _poController.text,
                              'latitude': '$_latitude',
                              'longitude': '$_longitude',
                            };
                            widget.onAddressAdded(data);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Submit',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _screenUtil.setSp(50),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _screenUtil.setWidth(30),
                      ),
                      Flexible(
                        child: ElevatedButton(
                          // color: Color(0xff9b7448),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _screenUtil.setSp(50),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _formField(
    String hintTitle,
    IconData icon, {
    @required final TextEditingController controller,
    final bool obscureText = false,
    final TextInputType inputType = TextInputType.text,
    final int maxLines = 1,
  }) {
    return Stack(
      children: [
        Container(
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            maxLines: maxLines,
            decoration: InputDecoration(
              fillColor: Color(0xfff4f4f8),
              filled: true,
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(_screenUtil.setWidth(30))),
                borderSide: BorderSide.none,
              ),
              hintText: hintTitle,
              contentPadding: EdgeInsets.only(
                  left: icon == null
                      ? _screenUtil.setWidth(28)
                      : _screenUtil.setWidth(100),
                  top: _screenUtil.setHeight(28),
                  bottom: _screenUtil.setHeight(28)),
              hintStyle: TextStyle(
                color: Color(0xffd8cfcc),
                fontSize: _screenUtil.setSp(40),
              ),
            ),
            keyboardType: inputType,
          ),
        ),
        icon != null
            ? Positioned(
                top: 0.0,
                bottom: 0.0,
                left: 0.0,
                child: Padding(
                  padding: EdgeInsets.all(_screenUtil.setWidth(28)),
                  child: Icon(
                    icon,
                    color: Color(0xffd9d9d9),
                    size: _screenUtil.setSp(40),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
