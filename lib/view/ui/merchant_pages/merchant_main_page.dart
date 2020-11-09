import 'package:flutter/material.dart';
import 'package:t3t3/view/ui/merchant_pages/merchant_main_pages/all_products.dart';
import 'package:t3t3/view/ui/merchant_pages/merchant_main_pages/main_page.dart';
import 'package:t3t3/view/ui/merchant_pages/merchant_main_pages/merchant_location.dart';
import 'package:t3t3/view/ui/merchant_pages/merchant_main_pages/new_products.dart';
import 'package:t3t3/view/ui/screen_util.dart';

class MerchantMainPage extends StatefulWidget {
  @override
  _MerchantMainPageState createState() => _MerchantMainPageState();
}

class _MerchantMainPageState extends State<MerchantMainPage>
    with TickerProviderStateMixin {
  ScreenUtil _screenUtil = ScreenUtil();

  TabController _tabController;

  int _currentTabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: 4,
      initialIndex: _currentTabIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);

    return Scaffold(
      appBar: TabBar(
        isScrollable: true,
        controller: _tabController,
        tabs: [
          Tab(
            child: Text(
              'Main Page',
              style: TextStyle(
                fontSize: _screenUtil.setSp(35),
                color: Colors.black,
              ),
            ),
          ),
          Tab(
            child: Text(
              'All Products',
              style: TextStyle(
                fontSize: _screenUtil.setSp(35),
                color: Colors.black,
              ),
            ),
          ),
          Tab(
            child: Text(
              'New Products',
              style: TextStyle(
                fontSize: _screenUtil.setSp(35),
                color: Colors.black,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Location',
              style: TextStyle(
                fontSize: _screenUtil.setSp(35),
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          MainPage(),
          AllProducts(),
          NewProducts(),
          MerchantLocation(),
        ],
      ),
    );
  }
}
