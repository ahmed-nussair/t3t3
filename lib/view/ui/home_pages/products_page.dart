import 'package:flutter/material.dart';

import 'product_item.dart';

List _categories = [
  'Electronics',
  'Mobile',
  'Fashion',
  'Kids',
  'Camera',
];

List _products = [
  {
    'imageUrl':
        'https://eg.jumia.is/HAdJcMrGb7POd8ZFbmLk4VYkJcg=/fit-in/220x220/filters:fill(white)/product/62/337611/1.jpg',
    'title': 'Arduino',
    'price': 10,
    'afterDiscount': 5,
    'rating': 4.5,
  },
  {
    'imageUrl':
    'https://images-na.ssl-images-amazon.com/images/I/71x0iZ4kf0L._AC_SX466_.jpg',
    'title': 'Acer G246HL Abd 24-Inch Screen LED-Lit Monitor',
    'price': 100,
    'afterDiscount': 100,
    'rating': 5.0,
  },
  {
    'imageUrl':
    'https://images-na.ssl-images-amazon.com/images/I/613rFMwkvPL._AC_SL1500_.jpg',
    'title':
    'Wireless Switch Pro Controller Gamepad Joypad Remote Joystick for Nintendo Switch Console',
    'price': 50,
    'afterDiscount': 45,
    'rating': 4.1,
  },
];

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage>
    with TickerProviderStateMixin {
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
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(3, (index) {
                return ProductItem(
                  title: _products[index]['title'],
                  imageUrl: _products[index]['imageUrl'],
                  afterDiscount: _products[index]['afterDiscount'],
                  price: _products[index]['price'],
                  rating: _products[index]['rating'],
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}
