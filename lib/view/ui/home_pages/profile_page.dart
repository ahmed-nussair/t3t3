import 'package:flutter/material.dart';
import 'package:t3t3/view/ui/screen_util.dart';
import 'profile_pages/addresses_page.dart';
import 'profile_pages/details_page.dart';
import 'profile_pages/orders_page.dart';

final List addresses = [
  {
    'firstLine': '40B, El-Swissry B, The 10th District',
    'secondLine': 'In front of Sa\'ad Ibn Aby Waqqas School',
    'city': 'Nasr City',
    'state': 'Cairo',
    'country': 'Egypt',
    'zipPostalCode': '5435435',
    'latitude': '30.046348',
    'longitude': '31.366725',
  },
  {
    'firstLine': '40B, El-Swissry B, The 10th District',
    'secondLine': '',
    'city': 'Nasr City',
    'state': 'Cairo',
    'country': 'Egypt',
    'zipPostalCode': '11134',
    'latitude': '30.047508',
    'longitude': '31.352309',
  },
];

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  TabController _tabController;
  int _currentTabIndex = 0;
  final _screenUtil = ScreenUtil();

  List _tabs = [
    'Profile',
    'Addresses',
    'Orders History',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: _currentTabIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            GestureDetector(
//              onTap: (){
//                _tabController.animateTo(0);
//              },
//                child: Text('Details')
//            ),
//            GestureDetector(
//              onTap: (){
//                _tabController.animateTo(1);
//              },
//                child: Text('Addresses')
//            ),
//          ],
//        ),
//      ),
      appBar: TabBar(
        isScrollable: false,
        controller: _tabController,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        tabs: List.generate(_tabs.length, (index) {
          return Tab(
            child: Text(
              '${_tabs[index]}',
              style: TextStyle(
                color: Colors.black,
                fontSize: _screenUtil.setSp(40),
              ),
              textAlign: TextAlign.center,
            ),
          );
        }),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          DetailsPage(),
          AddressesPage(addresses: addresses),
          OrdersPage(),
        ],
      ),
    );
  }
}
