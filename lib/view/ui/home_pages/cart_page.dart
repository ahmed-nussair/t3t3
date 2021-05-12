import 'package:flutter/material.dart';
import '../screen_util.dart';

class CartPage extends StatelessWidget {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'You don\'t have any item in your cart',
            style: TextStyle(
              fontSize: _screenUtil.setSp(50),
            ),
          ),
        ),
      ),
    );
  }
}
