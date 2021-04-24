import 'package:flutter/material.dart';
import 'package:t3t3/view/ui/screen_util.dart';

import '../../custom_show_dialog.dart';
import 'add_address.dart';
import 'address_item.dart';

class AddressesPage extends StatefulWidget {
  final List addresses;

  AddressesPage({@required this.addresses});

  @override
  _AddressesPageState createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  final _screenUtil = ScreenUtil();

  List _addressesList;

  @override
  void initState() {
    _addressesList = widget.addresses;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: List.generate(_addressesList.length, (index) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(_screenUtil.setHeight(50)),
                  child: Row(
                    children: [
                      Expanded(
                        child: AddressItem(
                          firstLine: _addressesList[index]['firstLine'],
                          secondLine: _addressesList[index]['secondLine'],
                          city: _addressesList[index]['city'],
                          state: _addressesList[index]['state'],
                          country: _addressesList[index]['country'],
                          zipPostalCode: _addressesList[index]['zipPostalCode'],
                          locationLatitude:
                              double.parse(_addressesList[index]['latitude']),
                          locationLongitude:
                              double.parse(_addressesList[index]['longitude']),
                        ),
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Color(0xff9b7448),
                            size: _screenUtil.setSp(50),
                          ),
                          SizedBox(
                            height: _screenUtil.setHeight(100),
                          ),
                          Icon(
                            Icons.remove,
                            color: Color(0xff9b7448),
                            size: _screenUtil.setSp(50),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            );
          }),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Padding(
            padding: EdgeInsets.all(_screenUtil.setWidth(50)),
            child: FloatingActionButton(
              backgroundColor: Color(0xff9b7448),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomAlertDialog(
                      titlePadding: EdgeInsets.all(0.0),
                      contentPadding: EdgeInsets.all(0.0),
                      content: AddAddress(
                        onAddressAdded: (address) {
                          List newList = _addressesList;
                          newList.add(address);
                          setState(() {
                            _addressesList = newList;
                          });
                        },
                      ),
                    );
                  },
                );
              },
              child: Icon(
                Icons.add,
                size: _screenUtil.setSp(60),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
