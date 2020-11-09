import 'package:flutter/material.dart';
import 'merchant_pages/merchant_info_page.dart';
import 'merchant_pages/merchant_main_page.dart';
import 'package:t3t3/view/ui/screen_util.dart';
import 'merchant_pages/merchant_contact_page.dart';

class MerchantPage extends StatefulWidget {
  @override
  _MerchantPageState createState() => _MerchantPageState();
}

class _MerchantPageState extends State<MerchantPage> {
  final ScreenUtil _screenUtil = ScreenUtil();

  int _index = 1;

  final int contactIndex = 2;
  final int mainIndex = 1;
  final int infoIndex = 0;

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: _screenUtil.setHeight(200),
          backgroundColor: Color(0xff471612),
          centerTitle: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: _screenUtil.setHeight(130),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                _screenUtil.setWidth(100)),
                          ),
                          hintText: 'Search in this store',
                          hintStyle: TextStyle(
                            fontSize: _screenUtil.setSp(50),
                          ),
                        ),
                      ),
                      Positioned(
                        right: _screenUtil.setWidth(30),
                        bottom: 0.0,
                        top: 0.0,
                        child: Icon(
                          Icons.search,
                          color: Color(0xff6a6a6a),
                          size: _screenUtil.setSp(70),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(_screenUtil.setHeight(30)),
                child: Image.asset(
                  'assets/dots.png',
                  height: _screenUtil.setHeight(70),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: _screenUtil.setSp(70),
              )),
        ),
        body: Column(
          children: [
            Container(
              height: _screenUtil.setHeight(275),
              color: Color(0xff471612),
              child: Padding(
                padding: EdgeInsets.all(_screenUtil.setWidth(50)),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/person.png'),
                            radius: _screenUtil.setWidth(70),
                          ),
                          SizedBox(
                            width: _screenUtil.setWidth(50),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'nussair_ahmed',
                                style: TextStyle(
                                  fontSize: _screenUtil.setSp(50),
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '20 Followers',
                                style: TextStyle(
                                  fontSize: _screenUtil.setSp(40),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: _screenUtil.setHeight(100),
                      width: _screenUtil.setWidth(300),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(_screenUtil.setWidth(50)),
                        color: Color(0xffff4749),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Text(
                            'Follow',
                            style: TextStyle(
                              fontSize: _screenUtil.setSp(50),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: _index == mainIndex
                  ? MerchantMainPage()
                  : _index == contactIndex
                      ? MerchantContactPage()
                      : _index == infoIndex ? MerchantInfoPage() : Container(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) {
            setState(() {
              _index = i;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Main')),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat), title: Text('Contact')),
          ],
        ),
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
    'category': 'Electronics',
    'subCategory': 'Accessories',
  },
  {
    'imageUrl':
        'https://images-na.ssl-images-amazon.com/images/I/71x0iZ4kf0L._AC_SX466_.jpg',
    'title': 'Acer G246HL Abd 24-Inch Screen LED-Lit Monitor',
    'price': 100.0,
    'afterDiscount': 100.0,
    'category': 'Electronics',
    'subCategory': 'Screens',
  },
  {
    'imageUrl':
        'https://images-na.ssl-images-amazon.com/images/I/613rFMwkvPL._AC_SL1500_.jpg',
    'title':
        'Wireless Switch Pro Controller Gamepad Joypad Remote Joystick for Nintendo Switch Console',
    'price': 50.0,
    'afterDiscount': 45.0,
    'category': 'Electronics',
    'subCategory': 'Gaming',
  },
];
