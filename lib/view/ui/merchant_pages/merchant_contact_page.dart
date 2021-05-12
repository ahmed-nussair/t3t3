import 'package:flutter/material.dart';
import '../screen_util.dart';

class MerchantContactPage extends StatefulWidget {
  @override
  _MerchantContactPageState createState() => _MerchantContactPageState();
}

class _MerchantContactPageState extends State<MerchantContactPage> {
  final _messageController = TextEditingController();
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: _screenUtil.setWidth(30),
                    ),
                    Icon(Icons.phone),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                        child: Stack(
                          children: <Widget>[
                            TextFormField(
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: 'Write your message here',
                                hintStyle:
                                    TextStyle(fontSize: _screenUtil.setSp(50)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(width: 1),
                                ),
                                contentPadding: EdgeInsets.only(
                                    left: _screenUtil.setWidth(30),
                                    right: _screenUtil.setWidth(30)),
                              ),
                            ),
                            Positioned(
                              right: 0.0,
                              top: 0.0,
                              bottom: 0.0,
                              child: Padding(
                                padding:
                                    EdgeInsets.all(_screenUtil.setWidth(30)),
                                child: GestureDetector(
                                  child: Icon(Icons.send),
                                  onTap: () {},
                                ),
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
        ],
      ),
    );
  }
}
