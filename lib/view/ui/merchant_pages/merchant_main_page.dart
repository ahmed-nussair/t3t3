import 'package:flutter/material.dart';
import 'merchant_main_pages/all_products.dart';
import 'merchant_main_pages/main_page.dart';
import 'merchant_main_pages/new_products.dart';
import '../screen_util.dart';

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
      length: 3,
      initialIndex: _currentTabIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);

    return Scaffold(
      appBar: TabBar(
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
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          MainPage(),
          AllProducts(),
          NewProducts(),
        ],
      ),
    );
  }
}