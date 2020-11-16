import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../screen_util.dart';

class RecommendedSlider extends StatelessWidget {
  final List itemsList;
  final ScreenUtil _screenUtil = ScreenUtil();

  RecommendedSlider({@required this.itemsList});

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);

    List<List> newItemsList = [];

    int size = (itemsList.length % 2) > 0
        ? ((itemsList.length ~/ 2) + 1).toInt()
        : itemsList.length ~/ 2;

    for (int i = 0; i < size; i++) {
      List list = [];
      list.add(itemsList[2 * i]);
      if (1 + (2 * i) < itemsList.length) list.add(itemsList[1 + (2 * i)]);

      newItemsList.add(list);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(_screenUtil.setWidth(30)),
          child: Text(
            'Recommended',
            style: TextStyle(
              fontSize: _screenUtil.setSp(50),
            ),
          ),
        ),
        CarouselSlider(
          items: List.generate(newItemsList.length, (index) {
            return RecommendedSliderItem(itemsList: newItemsList[index]);
          }),
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: false,
            viewportFraction: 1,
            aspectRatio: 1.4,
            enableInfiniteScroll: false,
          ),
        ),
      ],
    );
  }
}

class RecommendedSliderItem extends StatefulWidget {
  final List itemsList;

  RecommendedSliderItem({@required this.itemsList});

  @override
  _RecommendedSliderItemState createState() => _RecommendedSliderItemState();
}

class _RecommendedSliderItemState extends State<RecommendedSliderItem> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: _screenUtil.setWidth(30),
      crossAxisSpacing: _screenUtil.setWidth(30),
      childAspectRatio: .8,
      padding: EdgeInsets.all(_screenUtil.setWidth(30)),
      children: List.generate(widget.itemsList.length, (index) {
        return RecommendedItem(
          imageUrl: widget.itemsList[index]['imageUrl'],
          title: widget.itemsList[index]['title'],
          price: widget.itemsList[index]['price'],
          afterDiscount: widget.itemsList[index]['afterDiscount'],
        );
      }),
    );
  }
}

class RecommendedItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double afterDiscount;

  // final Function onMerchantNameTapped;

  RecommendedItem({
    @required this.imageUrl,
    @required this.title,
    @required this.price,
    @required this.afterDiscount,
    // @required this.onMerchantNameTapped,
  });

  @override
  _RecommendedItemState createState() => _RecommendedItemState();
}

class _RecommendedItemState extends State<RecommendedItem> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Material(
      elevation: _screenUtil.setWidth(5),
      shadowColor: Colors.black,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_screenUtil.setHeight(10)),
            child: Container(
              height: _screenUtil.setHeight(100),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: _screenUtil.setSp(40),
                ),
                overflow: TextOverflow.ellipsis, // so that text ends with dots
              ),
            ),
          ),
          Divider(),
          Container(
            height: _screenUtil.setHeight(80),
            child: widget.price == widget.afterDiscount
                ? Padding(
                    padding: EdgeInsets.all(_screenUtil.setHeight(10)),
                    child: Text(
                      '${widget.price.toStringAsFixed(2)} \$',
                      style: TextStyle(
                        fontSize: _screenUtil.setSp(40),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(_screenUtil.setHeight(10)),
                        child: Text(
                          '${widget.afterDiscount.toStringAsFixed(2)} \$',
                          style: TextStyle(
                            fontSize: _screenUtil.setSp(40),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_screenUtil.setHeight(10)),
                        child: Text(
                          '${widget.price.toStringAsFixed(2)} \$',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: _screenUtil.setSp(40),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
