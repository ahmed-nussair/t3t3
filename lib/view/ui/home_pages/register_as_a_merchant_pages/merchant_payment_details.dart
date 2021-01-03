import 'package:flutter/material.dart';
import 'package:t3t3/view/ui/screen_util.dart';

class MerchantPaymentDetails extends StatefulWidget {
  @override
  _MerchantPaymentDetailsState createState() => _MerchantPaymentDetailsState();
}

class _MerchantPaymentDetailsState extends State<MerchantPaymentDetails> {
  final ScreenUtil _screenUtil = ScreenUtil();

  bool _viaCreditCards;
  bool _cashOnDelivery;

  @override
  void initState() {
    _viaCreditCards = false;
    _cashOnDelivery = false;
    super.initState();
  }

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
                  'Specify Your Payment Methods:',
                  style: TextStyle(
                    fontSize: _screenUtil.setSp(40),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: _screenUtil.setHeight(50),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _viaCreditCards,
                      onChanged: (bool value) {
                        setState(() {
                          _viaCreditCards = value;
                        });
                      },
                    ),
                    Text(
                      'Via Credit Cards',
                      style: TextStyle(
                        fontSize: _screenUtil.setSp(40),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _cashOnDelivery,
                      onChanged: (bool value) {
                        setState(() {
                          _cashOnDelivery = value;
                        });
                      },
                    ),
                    Text(
                      'Cash On Delivery',
                      style: TextStyle(
                        fontSize: _screenUtil.setSp(40),
                      ),
                    )
                  ],
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
                  'If you are about to ship your items via shipping companies, please list your shipping companies:',
                  style: TextStyle(
                    fontSize: _screenUtil.setSp(40),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: _screenUtil.setHeight(50),
                ),
                Row(
                  children: [
                    Icon(Icons.add),
                    Text(
                      'Add a shipping company',
                      style: TextStyle(
                        fontSize: _screenUtil.setSp(40),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
