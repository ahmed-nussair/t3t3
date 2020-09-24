import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'product_item.dart';

List _categories = [
  'Electronics',
  'Mobile',
  'Fashion',
  'Kids',
  'Camera',
];

List _tabViews = [
  Center(
    child: Text('Electronics'),
  ),
  Center(
    child: Text('Mobile'),
  ),
  Center(
    child: Text('Fashion'),
  ),
  Center(
    child: Text('Kids'),
  ),
  Center(
    child: Text('Camera'),
  ),
  Center(
    child: Text('Electronics'),
  ),
];

List _products = [
  {
    'imageUrl':
        'https://eg.jumia.is/HAdJcMrGb7POd8ZFbmLk4VYkJcg=/fit-in/220x220/filters:fill(white)/product/62/337611/1.jpg',
    'title': 'Arduino',
    'price': 10.0,
    'afterDiscount': 5.0,
  },
  {
    'imageUrl':
        'https://images-na.ssl-images-amazon.com/images/I/71x0iZ4kf0L._AC_SX466_.jpg',
    'title': 'Acer G246HL Abd 24-Inch Screen LED-Lit Monitor',
    'price': 100.0,
    'afterDiscount': 100.0,
  },
  {
    'imageUrl':
        'https://images-na.ssl-images-amazon.com/images/I/613rFMwkvPL._AC_SL1500_.jpg',
    'title':
        'Wireless Switch Pro Controller Gamepad Joypad Remote Joystick for Nintendo Switch Console',
    'price': 50.0,
    'afterDiscount': 45.0,
  },
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _categories.length,
      vsync: this,
      initialIndex: _currentTabIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
//        appBar: AppBar(
//          title: Row(
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Icon(Icons.camera_alt),
//              ),
//              Expanded(
//                child: Container(
//                  padding: EdgeInsets.all(10),
//                  decoration: BoxDecoration(
//                    color: Colors.white,
//                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                  ),
//                  child: Stack(
//                    alignment: Alignment.center,
//                    children: <Widget>[
//                      Text(
//                        'Search For a Product',
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                          color: Color(0xff6a6a6a),
//                        ),
//                      ),
//                      Positioned(
//                        right: 0.0,
//                        bottom: 0.0,
//                        top: 0.0,
//                        child: Icon(Icons.search,
//                          color: Color(0xff6a6a6a),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
      body: Scaffold(
        appBar: TabBar(
          isScrollable: true,
          controller: _tabController,
          onTap: (index) {
            setState(() {
              _currentTabIndex = index;
            });
          },
          tabs: List.generate(_categories.length, (index) {
            return Tab(
              child: Text(
                '${_categories[index]}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            );
          }),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(_categories.length, (index) {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(8),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: List.generate(_products.length, (index) {
                      return ProductItem(
                        title: _products[index]['title'],
                        imageUrl: _products[index]['imageUrl'],
                        price: _products[index]['price'],
                        afterDiscount: _products[index]['afterDiscount'],
                      );
                    }),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    ));
  }
}
