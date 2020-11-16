import 'package:flutter/material.dart';
import 'merchant_pages/merchant_location.dart';
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
  final int locationIndex = 0;

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
                      : _index == locationIndex
                          ? MerchantLocation()
                          : Container(),
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
              icon: Icon(Icons.location_pin),
              label: 'Location',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Main',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat), label: 'Contact',
            ),
          ],
        ),
      ),
    );
  }
}