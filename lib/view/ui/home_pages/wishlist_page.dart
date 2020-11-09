import 'package:flutter/material.dart';
import 'package:t3t3/view/ui/screen_util.dart';

class WishListPage extends StatelessWidget {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'You don\'t have any item in the Wishlist',
            style: TextStyle(
              fontSize: _screenUtil.setSp(50),
            ),
          ),
        ),
      ),
    );
  }
}
