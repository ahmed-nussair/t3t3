import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:t3t3/view/ui/screen_util.dart';

class MerchantProductItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double afterDiscount;
  final double rating;

  // final Function onMerchantNameTapped;

  MerchantProductItem({
    @required this.imageUrl,
    @required this.title,
    @required this.price,
    @required this.afterDiscount,
    @required this.rating,
    // @required this.onMerchantNameTapped,
  });

  @override
  _MerchantProductItemState createState() => _MerchantProductItemState();
}

class _MerchantProductItemState extends State<MerchantProductItem> {
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
          Container(
            height: _screenUtil.setHeight(80),
            child: RatingBarIndicator(
              rating: widget.rating,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 30.0,
              direction: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
