import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'screen_util.dart';

import 'merchant_page.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _currentImageIndex = 0;
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            // product images
            Stack(
              children: [
                CarouselSlider(
                    items: List.generate(
                        productImages.length,
                        (index) => FutureBuilder(
                              future: _loadingImage(productImages[index]),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  bool imageLoaded = snapshot.data;

                                  if (imageLoaded) {
                                    return Image.network(
                                      productImages[index],
                                      fit: BoxFit.fill,
                                    );
                                  } else {
                                    return Image.asset('assets/noimage.jpg');
                                  }
                                }
                                return Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                    ],
                                  ),
                                );
                              },
                            )),
                    options: CarouselOptions(
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        })),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  child: Row(
                    children: List.generate(
                        productImages.length,
                        (index) => Padding(
                              padding: EdgeInsets.all(_screenUtil.setWidth(10)),
                              child: Container(
                                height: _currentImageIndex == index
                                    ? _screenUtil.setWidth(30)
                                    : _screenUtil.setWidth(20),
                                width: _currentImageIndex == index
                                    ? _screenUtil.setWidth(30)
                                    : _screenUtil.setWidth(20),
                                decoration: BoxDecoration(
                                  color: _currentImageIndex == index
                                      ? Colors.black26
                                      : Colors.black54,
                                  borderRadius: BorderRadius.circular(
                                      _screenUtil.setWidth(100)),
                                ),
                              ),
                            )),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  child: Padding(
                    padding: EdgeInsets.all(_screenUtil.setWidth(50)),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back)),
                  ),
                ),
              ],
            ),

            //product title
            Container(
              alignment: Alignment.center,
              child: Text(
                'Seagate Portable 2TB External Hard Drive Portable HDD',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _screenUtil.setSp(50),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(_screenUtil.setHeight(30)),
              child: RatingBarIndicator(
                rating: 4.5,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 30.0,
                direction: Axis.horizontal,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_screenUtil.setHeight(30)),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: _screenUtil.setHeight(80),
                    child: RichText(
                      maxLines: 1,
                      text: TextSpan(
                          style: TextStyle(
                            fontSize: _screenUtil.setSp(40),
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: 'Published by '),
                            TextSpan(
                              text: 'nussair',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // widget.onMerchantNameTapped();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MerchantPage()));
                                },
                              style: TextStyle(
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: _screenUtil.setWidth(30),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/person.png'),
                    radius: _screenUtil.setWidth(30),
                  )
                ],
              ),
            ),

            Divider(),

            Row(
              children: [
                SizedBox(
                  width: _screenUtil.setWidth(30),
                ),
                Text(
                  'Price: ',
                  style: TextStyle(
                    fontSize: _screenUtil.setSp(50),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '\$120',
                        style: TextStyle(
                          fontSize: _screenUtil.setSp(50),
                        ),
                      ),
                      Text(
                        '\$150',
                        style: TextStyle(
                          fontSize: _screenUtil.setSp(50),
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

            Divider(),
            Padding(
              padding: EdgeInsets.all(_screenUtil.setWidth(30)),
              child: Text(
                'Characteristics',
                style: TextStyle(
                  fontSize: _screenUtil.setSp(50),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: _screenUtil.setWidth(100),
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: _screenUtil.setHeight(100),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Brand',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _screenUtil.setSp(40),
                        ),
                      ),
                    ),
                    Container(
                      height: _screenUtil.setHeight(100),
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                        'Digital Storage Capacity',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _screenUtil.setSp(40),
                        ),
                      ),
                    ),
                    Container(
                      height: _screenUtil.setHeight(100),
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                        'Hardware Interface',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _screenUtil.setSp(40),
                        ),
                      ),
                    ),
                    Container(
                      height: _screenUtil.setHeight(100),
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                        'Read Speed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _screenUtil.setSp(40),
                        ),
                      ),
                    ),
                    Container(
                      height: _screenUtil.setHeight(100),
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                        'Compatible Devices',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _screenUtil.setSp(40),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: _screenUtil.setWidth(100),
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: _screenUtil.setHeight(100),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Seagate',
                        style: TextStyle(
                          fontSize: _screenUtil.setSp(40),
                        ),
                      ),
                    ),
                    Container(
                      height: _screenUtil.setHeight(100),
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                        '1 TB',
                        style: TextStyle(
                          fontSize: _screenUtil.setSp(40),
                        ),
                      ),
                    ),
                    Container(
                      height: _screenUtil.setHeight(100),
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                        'USB 3.0',
                        style: TextStyle(
                          fontSize: _screenUtil.setSp(40),
                        ),
                      ),
                    ),
                    Container(
                      height: _screenUtil.setHeight(100),
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                        '400 Megabytes Per Second',
                        style: TextStyle(
                          fontSize: _screenUtil.setSp(40),
                        ),
                      ),
                    ),
                    Container(
                      height: _screenUtil.setHeight(100),
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                        'Laptop',
                        style: TextStyle(
                          fontSize: _screenUtil.setSp(40),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(_screenUtil.setWidth(30)),
              child: Text(
                'About the product',
                style: TextStyle(
                  fontSize: _screenUtil.setSp(50),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Html(
              style: {
                "ul": Style(fontSize: FontSize.larger),
              },
              data: '<ul><li>Expands SSD is a mini USB 3.0 SSD is '
                  'featuring a lightweight, minimalist design for busy days and bustling '
                  'commutes</li><br/><br/><li>High-speed, portable solid state drive is perfect for '
                  'streaming stored videos directly to laptop, scrolling seamlessly through '
                  'photos, and backing up content on the go</li><br/><br/><li>This external drive '
                  'includes a USB cable that works seamlessly with Windows and Mac laptops '
                  '(purchase adapter separately for use with USB-C computers. Reformatting '
                  'may be required for use with time machine).</li><br/><br/><li>Enjoy long-term peace '
                  'of mind with the included three-year limited warranty</li><br/><br/><li>'
                  'Enjoy long-term peace of mind with the included three-year limited warranty '
                  'and three-year Rescue Services</li><br/><br/><ul>',
            ),
            Divider(),
            // options buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: _screenUtil.setHeight(150),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius:
                          BorderRadius.circular(_screenUtil.setWidth(50)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite),
                        SizedBox(
                          width: _screenUtil.setWidth(50),
                        ),
                        Text(
                          'Add To Wishlist',
                          style: TextStyle(
                            fontSize: _screenUtil.setSp(50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: _screenUtil.setHeight(150),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius:
                          BorderRadius.circular(_screenUtil.setWidth(50)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart),
                        SizedBox(
                          width: _screenUtil.setWidth(50),
                        ),
                        Text(
                          'Add To Shopping Cart',
                          style: TextStyle(
                            fontSize: _screenUtil.setSp(50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _loadingImage(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}

final List<String> productImages = [
  'https://i.ibb.co/cFgNY2c/1.jpg',
  'https://i.ibb.co/q5bmSNQ/2.jpg',
  'https://i.ibb.co/89BMfQx/3.jpg',
  'https://i.ibb.co/YbmN0Rc/4.jpg',
  'https://i.ibb.co/LCzSj72/5.jpg',
  'https://i.ibb.co/QnqgZQC/6.jpg',
];
