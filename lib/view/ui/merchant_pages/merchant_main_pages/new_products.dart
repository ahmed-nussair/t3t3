import 'package:flutter/material.dart';
import 'package:t3t3/view/ui/screen_util.dart';

import 'merchant_product_item.dart';

class NewProducts extends StatefulWidget {
  @override
  _NewProductsState createState() => _NewProductsState();
}

class _NewProductsState extends State<NewProducts> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
  }
}

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
