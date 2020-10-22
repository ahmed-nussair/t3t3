import 'package:flutter/material.dart';
import 'package:t3t3/view/ui/screen_util.dart';

import '../../../globals.dart';

class LoginAsAMerchantPage extends StatefulWidget {
  final Function onRegisteringAsAMerchant;

  LoginAsAMerchantPage({@required this.onRegisteringAsAMerchant});

  @override
  _LoginAsAMerchantPageState createState() => _LoginAsAMerchantPageState();
}

class _LoginAsAMerchantPageState extends State<LoginAsAMerchantPage> {
  final ScreenUtil _screenUtil = ScreenUtil();

  final TextEditingController _merchantUsernameController =
      TextEditingController();
  final TextEditingController _merchantPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Globals.loggedInAsAMerchant
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'You have already logged in as a merchant',
                  style: TextStyle(
                    fontSize: _screenUtil.setSp(50),
                  ),
                ),
                SizedBox(
                  height: _screenUtil.setHeight(50),
                ),
                Text(
                  'Sign out from your merchant account',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                    fontSize: _screenUtil.setSp(40),
                  ),
                ),
              ],
            ),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: _screenUtil.setWidth(20),
                      left: _screenUtil.setWidth(20)),
                  child: TextFormField(
                    controller: _merchantUsernameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your merchant username',
                      hintStyle: TextStyle(
                        fontSize: _screenUtil.setSp(40),
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(_screenUtil.setWidth(50)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _screenUtil.setHeight(50),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: _screenUtil.setWidth(20),
                      left: _screenUtil.setWidth(20)),
                  child: TextFormField(
                    controller: _merchantPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                        fontSize: _screenUtil.setSp(40),
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(_screenUtil.setWidth(50)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _screenUtil.setHeight(50),
                ),
                Text(
                  'Forgot your password',
                  style: TextStyle(
                    fontSize: _screenUtil.setSp(40),
                    decoration: TextDecoration.underline,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(
                  height: _screenUtil.setHeight(50),
                ),
                GestureDetector(
                  onTap: () {
                    widget.onRegisteringAsAMerchant();
                  },
                  child: Text(
                    'Don\'t have a merchant account? Create one',
                    style: TextStyle(
                      fontSize: _screenUtil.setSp(40),
                      decoration: TextDecoration.underline,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: _screenUtil.setHeight(50),
                ),
                ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(
                        right: _screenUtil.setWidth(30),
                        left: _screenUtil.setWidth(30),
                        top: _screenUtil.setWidth(20),
                        bottom: _screenUtil.setWidth(20)),
                    child: Container(
                      height: _screenUtil.setHeight(150),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(_screenUtil.setHeight(30))),
                        color: Color(0xff9b7448),
                      ),
                      child: Text(
                        'Log In As A Merchant',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _screenUtil.setSp(50),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
