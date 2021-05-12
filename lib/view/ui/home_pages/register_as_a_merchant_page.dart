import 'package:flutter/material.dart';
import 'register_as_a_merchant_pages/merchant_address_and_location.dart';
import 'register_as_a_merchant_pages/merchant_details.dart';
import 'register_as_a_merchant_pages/merchant_payment_details.dart';
import '../screen_util.dart';

class RegisterAsAMerchantPage extends StatefulWidget {
  @override
  _RegisterAsAMerchantPageState createState() =>
      _RegisterAsAMerchantPageState();
}

class _RegisterAsAMerchantPageState extends State<RegisterAsAMerchantPage>
    with TickerProviderStateMixin {
  final ScreenUtil _screenUtil = ScreenUtil();
  int _currentPageIndex = 0;

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          MerchantDetails(),
          MerchantsAddressAndLocation(),
          MerchantPaymentDetails(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: _tabController.index == 0
          ? GestureDetector(
              onTap: () {
                setState(() {
                  _tabController.animateTo(1);
                });
              },
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: _screenUtil.setHeight(150),
                    color: Colors.grey,
                    child: Text(
                      'Specify Your Address & Location',
                      style: TextStyle(
                        fontSize: _screenUtil.setSp(50),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    bottom: 0.0,
                    right: 0.0,
                    child: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),
            )
          : _tabController.index == 1
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _tabController.animateTo(2);
                      ;
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: _screenUtil.setHeight(150),
                        color: Colors.grey,
                        child: Text(
                          'Specify Your Payment Details',
                          style: TextStyle(
                            fontSize: _screenUtil.setSp(50),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        bottom: 0.0,
                        right: 0.0,
                        child: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    ],
                  ),
                )
              : _tabController.index == 2
                  ? GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: _screenUtil.setHeight(150),
                        color: Colors.grey,
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: _screenUtil.setSp(50),
                          ),
                        ),
                      ),
                    )
                  : Container(),
    );
  }
}
