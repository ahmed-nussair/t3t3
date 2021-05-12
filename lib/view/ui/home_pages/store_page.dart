import 'package:flutter/material.dart';
import '../screen_util.dart';

import '../../../globals.dart';

class StorePage extends StatelessWidget {
  final ScreenUtil _screenUtil = ScreenUtil();

  final Function onLoggingInAsAMerchant;

  StorePage({@required this.onLoggingInAsAMerchant});

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: Globals.loggedInAsAMerchant
            ? Center()
            : Center(
                child: GestureDetector(
                  onTap: () {
                    onLoggingInAsAMerchant();
                  },
                  child: Text(
                    'To see your store, log in as a merchant first',
                    style: TextStyle(
                      fontSize: _screenUtil.setSp(40),
                      decoration: TextDecoration.underline,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
