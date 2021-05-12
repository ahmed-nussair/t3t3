import 'package:flutter/material.dart';
import '../../screen_util.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailNameController = TextEditingController();
  final TextEditingController _phoneNameController = TextEditingController();
  final TextEditingController _passwordNameController = TextEditingController();

  final _screenUtil = ScreenUtil();

  bool _firstNameEditing;
  bool _lastNameEditing;
  String _oldValue;

  @override
  void initState() {
    _firstNameEditing = false;
    _lastNameEditing = false;
    _firstNameController.text = 'Ahmed';
    _lastNameController.text = 'Nussair';
    _emailNameController.text = 'anussair@gamil.com';
    _phoneNameController.text = '+20 111 830 1953';
    _passwordNameController.text = '123';
    _oldValue = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);

    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(0x55000000),
          radius: _screenUtil.setWidth(100),
          backgroundImage: AssetImage('assets/person.png'),
        ),
        Text(
          '\$50.0',
          style: TextStyle(
            fontSize: _screenUtil.setSp(100),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_screenUtil.setWidth(30)),
          child: Stack(
            children: [
              TextFormField(
                autofocus: _firstNameEditing,
                controller: _firstNameController,
                style: TextStyle(
                  color: _firstNameEditing ? Colors.black : Colors.grey,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  enabled: _firstNameEditing,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(_screenUtil.setWidth(50)),
                  ),
                ),
              ),
              Positioned(
                top: 0.0,
                bottom: 0.0,
                right: 0.0,
                child: Padding(
                  padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                  child: GestureDetector(
                    onTap: () {
                      _oldValue = _firstNameController.text;
                      setState(() {
                        _firstNameEditing = true;
                      });
                    },
                    child: _firstNameEditing
                        ? Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _firstNameEditing = false;
                                  });
                                  _firstNameController.text = _oldValue;
                                },
                                child: Icon(Icons.cancel),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _firstNameEditing = false;
                                  });
                                },
                                child: Icon(Icons.check),
                              ),
                            ],
                          )
                        : Icon(Icons.edit),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_screenUtil.setWidth(30)),
          child: Stack(
            children: [
              TextFormField(
                controller: _lastNameController,
                style: TextStyle(
                  color: _lastNameEditing ? Colors.black : Colors.grey,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  enabled: _lastNameEditing,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(_screenUtil.setWidth(50)),
                  ),
                ),
              ),
              Positioned(
                top: 0.0,
                bottom: 0.0,
                right: 0.0,
                child: Padding(
                  padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                  child: GestureDetector(
                    onTap: () {
                      _oldValue = _lastNameController.text;
                      setState(() {
                        _lastNameEditing = true;
                      });
                    },
                    child: _lastNameEditing
                        ? Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _lastNameEditing = false;
                                  });
                                  _lastNameController.text = _oldValue;
                                },
                                child: Icon(Icons.cancel),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _lastNameEditing = false;
                                  });
                                },
                                child: Icon(Icons.check),
                              ),
                            ],
                          )
                        : Icon(Icons.edit),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_screenUtil.setWidth(30)),
          child: TextFormField(
            controller: _emailNameController,
            style: TextStyle(
              color: Colors.grey,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              enabled: false,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_screenUtil.setWidth(50)),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_screenUtil.setWidth(30)),
          child: TextFormField(
            controller: _phoneNameController,
            style: TextStyle(
              color: Colors.grey,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              enabled: false,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_screenUtil.setWidth(50)),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_screenUtil.setWidth(30)),
          child: TextFormField(
            controller: _passwordNameController,
            obscureText: true,
            style: TextStyle(
              color: Colors.grey,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              enabled: false,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_screenUtil.setWidth(50)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
