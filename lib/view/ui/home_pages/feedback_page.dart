import 'package:flutter/material.dart';
import 'package:t3t3/view/ui/screen_util.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: _screenUtil.setHeight(50),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Any Feedback',
              style: TextStyle(
                fontSize: _screenUtil.setSp(70),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_screenUtil.setHeight(50)),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: _screenUtil.setSp(50),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(_screenUtil.setWidth(50)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_screenUtil.setHeight(50)),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 15,
              decoration: InputDecoration(
                hintText: 'Your Message',
                hintStyle: TextStyle(
                  fontSize: _screenUtil.setSp(50),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(_screenUtil.setWidth(50)),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(_screenUtil.setWidth(50)),
          color: Color(0xff9b7448),
          child: Text(
            'Submit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: _screenUtil.setSp(50),
            ),
          ),
        ),
      ),
    );
  }
}
