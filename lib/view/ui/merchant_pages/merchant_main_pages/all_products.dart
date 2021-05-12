import 'package:flutter/material.dart';
import '../../screen_util.dart';

import 'merchant_product_item.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts>
    with TickerProviderStateMixin {
  TabController _tabController;
  int _currentTabIndex = 0;

  final ScreenUtil _screenUtil = ScreenUtil();

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
    _screenUtil.init(context);
    return SafeArea(
        child: Scaffold(
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
                  fontSize: _screenUtil.setSp(35),
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
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverGrid.count(
                    crossAxisCount: 4,
                    children: List.generate(_subCategories.length, (index) {
                      return Padding(
                        padding: EdgeInsets.all(_screenUtil.setWidth(10)),
                        child: Column(
                          children: [
                            Flexible(
                              flex: 5,
                              child: Container(
                                height: _screenUtil.setWidth(150),
                                width: _screenUtil.setWidth(150),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: _screenUtil.setHeight(1),
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          _screenUtil.setHeight(100))),
                                  image: index > 0
                                      ? DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            _subCategories[index]['imageUrl'],
                                          ),
                                        )
                                      : DecorationImage(
                                          scale: _screenUtil.setWidth(10),
                                          image: AssetImage(
                                            _subCategories[index]['imageUrl'],
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Text(
                                _subCategories[index]['title'],
                                style: TextStyle(
                                    fontSize: _screenUtil.setSp(35),
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                    sliver: SliverGrid.count(
                      crossAxisCount: 2,
                      childAspectRatio: .9,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      children: List.generate(_products.length, (index) {
                        return MerchantProductItem(
                          title: _products[index]['title'],
                          imageUrl: _products[index]['imageUrl'],
                          price: _products[index]['price'],
                          afterDiscount: _products[index]['afterDiscount'],
                          rating: _products[index]['rating'],
                          // onMerchantNameTapped: widget.onMerchantNameTapped,
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    ));
  }
}

List _subCategories = [
  {
    'imageUrl': 'assets/all_sub_categories.png',
    'title': 'All',
    'onTapped': () {
      print('tapped');
    },
  },
  {
    'imageUrl': 'https://i.ibb.co/pKWmpMT/tv-and-video.jpg',
    'title': 'TV & Videos',
    'onTapped': () {
      print('tapped');
    },
  },
  {
    'imageUrl': 'https://i.ibb.co/v1Bbv0t/cameras.jpg',
    'title': 'Cameras',
    'onTapped': () {
      print('tapped');
    },
  },
  {
    'imageUrl': 'https://i.ibb.co/TBkqBs2/headphones.jpg',
    'title': 'Headphones',
    'onTapped': () {
      print('tapped');
    },
  },
  {
    'imageUrl': 'https://i.ibb.co/w7Sq0rd/home-audio.jpg',
    'title': 'Home Audio',
    'onTapped': () {
      print('tapped');
    },
  }
];

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
    'price': 10.0,
    'afterDiscount': 5.0,
    'rating': 4.5,
  },
  {
    'imageUrl':
        'https://images-na.ssl-images-amazon.com/images/I/71x0iZ4kf0L._AC_SX466_.jpg',
    'title': 'Acer G246HL Abd 24-Inch Screen LED-Lit Monitor',
    'price': 100.0,
    'afterDiscount': 100.0,
    'rating': 5.0,
  },
  {
    'imageUrl':
        'https://images-na.ssl-images-amazon.com/images/I/613rFMwkvPL._AC_SL1500_.jpg',
    'title':
        'Wireless Switch Pro Controller Gamepad Joypad Remote Joystick for Nintendo Switch Console',
    'price': 50.0,
    'afterDiscount': 45.0,
    'rating': 4.1,
  },
];
