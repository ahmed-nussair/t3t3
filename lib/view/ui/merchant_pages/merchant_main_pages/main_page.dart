import 'package:flutter/material.dart';
import 'hot_offer_slider.dart';
import 'recommended_slider.dart';
import '../../screen_util.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return ListView(
      children: [
        HotOfferSlider(itemsList: _products),
        SizedBox(
          height: _screenUtil.setHeight(100),
        ),
        RecommendedSlider(itemsList: _products),
        SizedBox(
          height: _screenUtil.setHeight(100),
        ),
      ],
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
];
