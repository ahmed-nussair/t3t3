import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../screen_util.dart';

class MerchantDetails extends StatefulWidget {
  @override
  _MerchantDetailsState createState() => _MerchantDetailsState();
}

class _MerchantDetailsState extends State<MerchantDetails> {
  final ScreenUtil _screenUtil = ScreenUtil();

  final TextEditingController _merchantNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  bool _asUsername;
  bool _sameEmail;
  bool _samePhone;

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
    _asUsername = false;
    _sameEmail = false;
    _samePhone = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return ListView(
      children: [
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
              borderRadius:
                  BorderRadius.all(Radius.circular(_screenUtil.setWidth(100))),
            ),
            SizedBox(
              width: _screenUtil.setWidth(50),
            ),
            GestureDetector(
              onTap: () async {
                final pickedFile =
                    await picker.getImage(source: ImageSource.gallery);

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
        Divider(),
        Padding(
            padding: EdgeInsets.only(
                right: _screenUtil.setWidth(30),
                left: _screenUtil.setWidth(30),
                top: _screenUtil.setWidth(20),
                bottom: _screenUtil.setWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _formField(
                  'Merchant Name',
                  Icons.person,
                  controller: _merchantNameController,
                  obscureText: false,
                  enabled: _asUsername ? false : true,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _asUsername,
                      onChanged: (bool value) {
                        setState(() {
                          _asUsername = value;
                          if (value) {
                            _merchantNameController.text = 'ahmed_nussair';
                          } else {
                            _merchantNameController.text = '';
                          }
                        });
                      },
                    ),
                    Text(
                      'The merchant name will be as username',
                      style: TextStyle(
                        fontSize: _screenUtil.setSp(40),
                      ),
                    )
                  ],
                ),
              ],
            )),
        Divider(),
        Padding(
            padding: EdgeInsets.only(
                right: _screenUtil.setWidth(30),
                left: _screenUtil.setWidth(30),
                top: _screenUtil.setWidth(20),
                bottom: _screenUtil.setWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _formField(
                  'Email',
                  Icons.email,
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                  obscureText: false,
                  enabled: _sameEmail ? false : true,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _sameEmail,
                      onChanged: (bool value) {
                        setState(() {
                          _sameEmail = value;
                          if (value) {
                            _emailController.text = 'anussair@gmail.com';
                          } else {
                            _emailController.text = '';
                          }
                        });
                      },
                    ),
                    Text(
                      'The email will be the same email',
                      style: TextStyle(
                        fontSize: _screenUtil.setSp(40),
                      ),
                    )
                  ],
                ),
              ],
            )),
        Divider(),
        Padding(
            padding: EdgeInsets.only(
                right: _screenUtil.setWidth(30),
                left: _screenUtil.setWidth(30),
                top: _screenUtil.setWidth(20),
                bottom: _screenUtil.setWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _formField(
                  'Phone',
                  Icons.phone,
                  controller: _phoneController,
                  inputType: TextInputType.phone,
                  obscureText: false,
                  enabled: _samePhone ? false : true,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _samePhone,
                      onChanged: (bool value) {
                        setState(() {
                          _samePhone = value;
                          if (value) {
                            _phoneController.text = '00201118301953';
                          } else {
                            _phoneController.text = '';
                          }
                        });
                      },
                    ),
                    Text(
                      'The phone will be the same phone',
                      style: TextStyle(
                        fontSize: _screenUtil.setSp(40),
                      ),
                    )
                  ],
                ),
              ],
            )),
        Divider(),
        Padding(
            padding: EdgeInsets.only(
                right: _screenUtil.setWidth(30),
                left: _screenUtil.setWidth(30),
                top: _screenUtil.setWidth(20),
                bottom: _screenUtil.setWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    fillColor: Color(0xfff4f4f8),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(_screenUtil.setWidth(30))),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Explain Your Business',
                    contentPadding: EdgeInsets.only(
                        left: _screenUtil.setWidth(100),
                        top: _screenUtil.setHeight(28),
                        bottom: _screenUtil.setHeight(28)),
                    hintStyle: TextStyle(
                      color: Color(0xffd8cfcc),
                      fontSize: _screenUtil.setSp(40),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                ),
                Row(
                  children: [
                    Icon(Icons.add),
                    Text(
                      'Attach a picture',
                      style: TextStyle(
                        fontSize: _screenUtil.setSp(40),
                      ),
                    )
                  ],
                ),
              ],
            )),
        Divider(),
        Padding(
          padding: EdgeInsets.only(
              right: _screenUtil.setWidth(30),
              left: _screenUtil.setWidth(30),
              top: _screenUtil.setWidth(20),
              bottom: _screenUtil.setWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Your Business Categories:',
                style: TextStyle(
                  fontSize: _screenUtil.setSp(40),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0,
                children: List.generate(
                    _categories.length,
                    (index) => CategoryItem(
                          fontSize: _screenUtil.setSp(40),
                          label: _categories[index],
                        )),
              ),
              Text(
                'You can add more categories for your business(if not listed above).',
                style: TextStyle(
                  fontSize: _screenUtil.setSp(40),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: _formField(
                      'More Business Category',
                      Icons.category,
                      controller: _categoryController,
                      inputType: TextInputType.text,
                      obscureText: false,
                    ),
                  ),
                  Icon(Icons.add),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _formField(
    String hintTitle,
    IconData icon, {
    @required final TextEditingController controller,
    final bool obscureText = false,
    final TextInputType inputType = TextInputType.text,
    final bool enabled = true,
  }) {
    return Stack(
      children: [
        Container(
          height: _screenUtil.setHeight(120),
          child: TextFormField(
            enabled: enabled,
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

class CategoryItem extends StatefulWidget {
  final String label;
  final double fontSize;

  CategoryItem({
    @required this.label,
    @required this.fontSize,
  });

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool _checked;

  @override
  void initState() {
    _checked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        children: [
          Checkbox(
              value: _checked,
              onChanged: (value) {
                setState(() {
                  _checked = true;
                });
              }),
          Text(
            widget.label,
            style: TextStyle(
              fontSize: widget.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}

List _categories = [
  'Electronics',
  'Mobile',
  'Fashion',
  'Kids',
  'Camera',
];
