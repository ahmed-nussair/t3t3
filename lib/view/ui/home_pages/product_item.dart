import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double afterDiscount;

  ProductItem({
    @required this.imageUrl,
    @required this.title,
    @required this.price,
    @required this.afterDiscount,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.black,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              widget.imageUrl, height: 10,
//              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // so that text ends with dots
            ),
          ),
          Divider(),
          widget.price == widget.afterDiscount
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.price.toStringAsFixed(2)} \$',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text('${widget.afterDiscount.toStringAsFixed(2)} \$'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${widget.price.toStringAsFixed(2)} \$',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
