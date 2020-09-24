import 'package:flutter/material.dart';

import 'country_code.dart';
import 'custom_show_dialog.dart';
import 'screen_util.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _formKey = GlobalKey();

  final _screenUtil = ScreenUtil();

  String _countryCode;

  bool _signingUp;

  @override
  void initState() {
    _countryCode = '+962';
    _signingUp = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);

    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    final _userNameController = TextEditingController();
    final _emailController = TextEditingController();
    final _phoneController = TextEditingController();
    final _passwordController = TextEditingController();
    final _passwordConfirmController = TextEditingController();

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Image.asset(
                        'assets/logo.png',
                        height: _screenUtil.setHeight(300),
                      ),

                      // Username
                      Padding(
                        padding: EdgeInsets.only(
                            right: _screenUtil.setWidth(30),
                            left: _screenUtil.setWidth(30),
                            top: _screenUtil.setWidth(20),
                            bottom: _screenUtil.setWidth(20)),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                child: _formField(
                              'First Name',
                              Icons.person,
                              controller: _firstNameController,
                            )),
                            Padding(
                              padding: EdgeInsets.all(_screenUtil.setWidth(20)),
                            ),
                            Flexible(
                              child: _formField(
                                'Last Name',
                                Icons.person,
                                controller: _lastNameController,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // user name
                      Padding(
                        padding: EdgeInsets.only(
                            right: _screenUtil.setWidth(30),
                            left: _screenUtil.setWidth(30),
                            top: _screenUtil.setWidth(20),
                            bottom: _screenUtil.setWidth(20)),
                        child: _formField(
                          'Username',
                          Icons.person,
                          controller: _userNameController,
                        ),
                      ),

                      // email
                      Padding(
                        padding: EdgeInsets.only(
                            right: _screenUtil.setWidth(30),
                            left: _screenUtil.setWidth(30),
                            top: _screenUtil.setWidth(20),
                            bottom: _screenUtil.setWidth(20)),
                        child: _formField(
                          'Email',
                          Icons.email,
                          controller: _emailController,
                          inputType: TextInputType.emailAddress,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            right: _screenUtil.setWidth(30),
                            left: _screenUtil.setWidth(30),
                            top: _screenUtil.setWidth(20),
                            bottom: _screenUtil.setWidth(20)),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              child: CustomAlertDialog(
                                titlePadding: EdgeInsets.all(0.0),
                                contentPadding: EdgeInsets.all(0.0),
                                content: CountryCode(
                                  onCountryCodeSelected: (countryCode) {
                                    setState(() {
                                      _countryCode = countryCode;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: _screenUtil.setHeight(120),
                            padding: EdgeInsets.all(_screenUtil.setWidth(28)),
                            decoration: BoxDecoration(
                              color: Color(0xfff4f4f8),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(_screenUtil.setWidth(30))),
                            ),
                            child: Text(
                              'Select Your Country',
                              style: TextStyle(
                                fontSize: _screenUtil.setSp(40),
                                color: Color(0xffd8cfcc),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Phone
                      Padding(
                        padding: EdgeInsets.only(
                            right: _screenUtil.setWidth(30),
                            left: _screenUtil.setWidth(30),
                            top: _screenUtil.setWidth(20),
                            bottom: _screenUtil.setWidth(20)),
                        child: Row(
                          children: [
                            // country code
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    child: CustomAlertDialog(
                                      titlePadding: EdgeInsets.all(0.0),
                                      contentPadding: EdgeInsets.all(0.0),
                                      content: CountryCode(
                                        onCountryCodeSelected: (countryCode) {
                                          setState(() {
                                            _countryCode = countryCode;
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: _screenUtil.setWidth(800),
                                  height: _screenUtil.setHeight(120),
                                  padding:
                                      EdgeInsets.all(_screenUtil.setHeight(25)),
                                  decoration: BoxDecoration(
                                    color: Color(0xfff4f4f8),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            _screenUtil.setWidth(30))),
                                  ),
                                  child: Text(
                                    _countryCode,
                                    style: TextStyle(
                                      fontSize: _screenUtil.setSp(40),
                                      color: Color(0xffd8cfcc),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // spacing
                            Padding(
                              padding: EdgeInsets.all(_screenUtil.setWidth(10)),
                            ),
                            Flexible(
                              flex: 3,
                              child: _formField(
                                'Phone',
                                Icons.phone,
                                controller: _phoneController,
                                inputType: TextInputType.phone,
                              ),
                            )
                          ],
                        ),
                      ),

                      // password
                      Padding(
                        padding: EdgeInsets.only(
                            right: _screenUtil.setWidth(30),
                            left: _screenUtil.setWidth(30),
                            top: _screenUtil.setWidth(20),
                            bottom: _screenUtil.setWidth(20)),
                        child: _formField(
                          'Password',
                          Icons.lock,
                          controller: _passwordController,
                          obscureText: true,
                        ),
                      ),

                      // confirm password
                      Padding(
                        padding: EdgeInsets.only(
                            right: _screenUtil.setWidth(30),
                            left: _screenUtil.setWidth(30),
                            top: _screenUtil.setWidth(20),
                            bottom: _screenUtil.setWidth(20)),
                        child: _formField(
                          'Confirm Password',
                          Icons.lock,
                          controller: _passwordConfirmController,
                          obscureText: true,
                        ),
                      ),

                      ListTile(
                        onTap: () {
//                  Navigator.of(context).pushReplacementNamed('/Home');
                          print('${_emailController.text}');
                          print('${_passwordController.text}');
                        },
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: _screenUtil.setHeight(150),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(_screenUtil.setHeight(30))),
                              color: Color(0xff9b7448),
                            ),
                            child: Text(
                              'Sign Up',
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
                ),
                Positioned(
                  top: _screenUtil.setHeight(30),
                  left: _screenUtil.setWidth(30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: _screenUtil.setSp(70),
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(_screenUtil.setWidth(50)),
                color: Color(0xff9b7448),
                child: Text(
                  'Back to login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _screenUtil.setWidth(50),
                  ),
                ),
              ),
            ),
          ),
          _signingUp
              ? Positioned(
                  top: 0.0,
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black.withOpacity(0.2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: _screenUtil.setWidth(200),
                          height: _screenUtil.setWidth(200),
                          child: CircularProgressIndicator(
                            strokeWidth: _screenUtil.setSp(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _formField(String hintTitle, IconData icon,
      {@required final TextEditingController controller,
      final bool obscureText = false,
      final TextInputType inputType = TextInputType.text}) {
    return Stack(
      children: [
        Container(
          height: _screenUtil.setHeight(120),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              fillColor: Color(0xfff4f4f8),
              filled: true,
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(_screenUtil.setWidth(30))),
                borderSide: BorderSide.none,
              ),
              hintText: hintTitle,
              contentPadding: EdgeInsets.only(
                  left: _screenUtil.setWidth(100),
                  top: _screenUtil.setHeight(28),
                  bottom: _screenUtil.setHeight(28)),
              hintStyle: TextStyle(
                color: Color(0xffd8cfcc),
                fontSize: _screenUtil.setSp(40),
              ),
            ),
            keyboardType: inputType,
          ),
        ),
        Positioned(
          top: 0.0,
          bottom: 0.0,
          left: 0.0,
          child: Padding(
            padding: EdgeInsets.all(_screenUtil.setWidth(28)),
            child: Icon(
              icon,
              color: Color(0xffd9d9d9),
              size: _screenUtil.setSp(40),
            ),
          ),
        ),
      ],
    );
  }
}
