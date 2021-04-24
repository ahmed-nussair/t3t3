import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  String _countryName;
  String _countryCode;
  double _latitude;
  double _longitude;

  bool _signingUp;

  Gender _gender;

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    _countryName = '';
    _countryCode = '+962';
    _signingUp = false;
    _gender = Gender.Male;
    _latitude = 0;
    _longitude = 0;
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
                      // Upload photo
                      Row(
                        children: [
                          ClipRRect(
                            child: CircleAvatar(
                              child: _image == null
                                  ? Image.asset(
                                      'assets/person.png',
                                      width: _screenUtil.setWidth(150),
                                      height: _screenUtil.setWidth(150),
                                    )
                                  : Image.file(
                                      _image,
                                      width: _screenUtil.setWidth(150),
                                      height: _screenUtil.setWidth(150),
                                    ),
                              radius: _screenUtil.setWidth(100),
                              backgroundColor: Color(0xfff4f4f8),
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(_screenUtil.setWidth(100))),
                          ),
                          SizedBox(
                            width: _screenUtil.setWidth(50),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final pickedFile = await picker.getImage(
                                  source: ImageSource.gallery);

                              setState(() {
                                if (pickedFile != null) {
                                  _image = File(pickedFile.path);
                                } else {
                                  print('No image selected.');
                                }
                              });
                            },
                            child: Text(
                              'Upload A Photo',
                              style: TextStyle(
                                fontSize: _screenUtil.setSp(40),
                                decoration: TextDecoration.underline,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
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

                      // Gender
                      Padding(
                        padding: EdgeInsets.only(
                            right: _screenUtil.setWidth(30),
                            left: _screenUtil.setWidth(30),
                            top: _screenUtil.setWidth(20),
                            bottom: _screenUtil.setWidth(20)),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: _screenUtil.setHeight(120),
                          padding: EdgeInsets.all(_screenUtil.setWidth(28)),
                          decoration: BoxDecoration(
                            color: Color(0xfff4f4f8),
                            borderRadius: BorderRadius.all(
                                Radius.circular(_screenUtil.setWidth(30))),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.wc,
                                color: Color(0xffd9d9d9),
                                size: _screenUtil.setSp(50),
                              ),
                              SizedBox(
                                width: _screenUtil.setWidth(40),
                              ),
                              Text(
                                'Your Gender: ',
                                style: TextStyle(
                                  fontSize: _screenUtil.setSp(40),
                                  color: Color(0xffd8cfcc),
                                ),
                              ),
                              Radio(
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value;
                                  });
                                },
                                value: Gender.Male,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: _screenUtil.setSp(40),
                                  color: Color(0xffd8cfcc),
                                ),
                              ),
                              Radio(
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value;
                                  });
                                },
                                value: Gender.Female,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: _screenUtil.setSp(40),
                                  color: Color(0xffd8cfcc),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // country
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
                              builder: (context) {
                                return CustomAlertDialog(
                                  titlePadding: EdgeInsets.all(0.0),
                                  contentPadding: EdgeInsets.all(0.0),
                                  content: CountryCode(
                                    onCountryCodeSelected:
                                        (countryName, countryCode) {
                                      setState(() {
                                        _countryName = countryName;
                                        _countryCode = countryCode;
                                      });
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: _screenUtil.setHeight(120),
                                padding:
                                EdgeInsets.all(_screenUtil.setWidth(28)),
                                decoration: BoxDecoration(
                                  color: Color(0xfff4f4f8),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          _screenUtil.setWidth(30))),
                                ),
                                child: Text(
                                  _countryName.isEmpty
                                      ? 'Select Your Country'
                                      : _countryName,
                                  style: TextStyle(
                                    fontSize: _screenUtil.setSp(40),
                                    color: Color(0xffd8cfcc),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0.0,
                                bottom: 0.0,
                                left: _screenUtil.setWidth(20),
                                child: Icon(
                                  Icons.flag,
                                  color: Color(0xffd8cfcc),
                                  size: _screenUtil.setSp(50),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Google map location
                      Padding(
                        padding: EdgeInsets.only(
                            right: _screenUtil.setWidth(30),
                            left: _screenUtil.setWidth(30),
                            top: _screenUtil.setWidth(20),
                            bottom: _screenUtil.setWidth(20)),
                        child: GestureDetector(
                          onTap: () {},
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: _screenUtil.setHeight(120),
                                padding:
                                EdgeInsets.all(_screenUtil.setWidth(28)),
                                decoration: BoxDecoration(
                                  color: Color(0xfff4f4f8),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          _screenUtil.setWidth(30))),
                                ),
                                child: Text(
                                  _latitude == 0 && _longitude == 0
                                      ? 'Specify Your Location on Google Map'
                                      : '$_latitude, $_longitude',
                                  style: TextStyle(
                                    fontSize: _screenUtil.setSp(40),
                                    color: Color(0xffd8cfcc),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0.0,
                                bottom: 0.0,
                                left: _screenUtil.setWidth(20),
                                child: Icon(
                                  Icons.location_pin,
                                  color: Color(0xffd8cfcc),
                                  size: _screenUtil.setSp(50),
                                ),
                              )
                            ],
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
                              color: Colors.black26,
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
            // bottomNavigationBar: GestureDetector(
            //   onTap: () {
            //     Navigator.of(context).pop();
            //   },
            //   child: Container(
            //     padding: EdgeInsets.all(_screenUtil.setWidth(50)),
            //     color: Color(0xff9b7448),
            //     child: Text(
            //       'Back to login',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: _screenUtil.setWidth(50),
            //       ),
            //     ),
            //   ),
            // ),
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

enum Gender {
  Male,
  Female,
}
