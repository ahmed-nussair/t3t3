import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../screen_util.dart';

class MerchantProductItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double afterDiscount;
  final String category;
  final String subCategory;

  MerchantProductItem({
    @required this.imageUrl,
    @required this.title,
    @required this.price,
    @required this.afterDiscount,
    @required this.category,
    @required this.subCategory,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<MerchantProductItem> {
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          Divider(),
          Padding(
            padding: EdgeInsets.all(_screenUtil.setHeight(10)),
            child: Container(
              alignment: Alignment.centerLeft,
              height: _screenUtil.setHeight(80),
              child: Text(
                '${widget.category} -> ${widget.subCategory}',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: _screenUtil.setSp(40),
                ),
                overflow: TextOverflow.ellipsis, // so that text ends with dots
              ),
            ),
          ),
        ],
      ),
    );
  }
}
