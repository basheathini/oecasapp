import 'package:flutter/material.dart';
import 'package:oecasapp/custom_views.dart';
import 'package:oecasapp/custom_widgets.dart';
class RegisterUser extends StatefulWidget {
  static const routeName = '/register-user';
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

enum UserType { administrator, general }
class _RegisterUserState extends State<RegisterUser> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: AppBarText('User Registration'),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        height: deviceSize.height,
        width: deviceSize.width,
        child: Column(
          children: [
            Form(
              // key: _formOne,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 55, bottom: 5),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 45.0, right: 45.0),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: TextFormField(
                                // initialValue: firstName != '' ? firstName : '',
                                // initialValue: 'Athini',
                                textCapitalization: TextCapitalization.sentences,
                                textInputAction: TextInputAction.next,
                                // focusNode: _firstNameFocusNode,
                                keyboardType: TextInputType.text,

                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Quicksand',
                                ),
                                onFieldSubmitted: (_) {
                                  // FocusScope.of(context).requestFocus(_lastNameFocusNode);
                                },
                                validator: (value) {
//                                      String newValue = value.trim();
                                  if (value.trim().isEmpty) {
                                    return 'Input cannot be empty';
                                  } else if (value.trim().contains(RegExp('[^A-Za-z0-9]'))) {
                                    return 'Input cannot contain special characters';
                                  }
                                  // firstName = value;
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    labelText: 'First Name'),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: TextFormField(
                                // initialValue: lastName != '' ? lastName : '',
                                // initialValue: 'Bashe',
                                textCapitalization: TextCapitalization.sentences,
                                textInputAction: TextInputAction.next,
                                // focusNode: _lastNameFocusNode,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Quicksand',
                                ),
                                onFieldSubmitted: (_) {
                                  // FocusScope.of(context).requestFocus(_dateOfBirthFocusNode);
                                },
                                validator: (value) {
                                  if (value.trim().isEmpty) {
                                    return 'Input cannot be empty';
                                  } else if (value.trim().contains(RegExp('[^A-Za-z0-9]'))) {
                                    return 'Input cannot contain special characters';
                                  }
                                  // lastName = value;
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    labelText: 'Last Name'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 45.0, right: 45.0),
                    child: TextFormField(
                      // initialValue: id != '' ? id : '',
                      // initialValue: '9107206152088',
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      // focusNode: _dateOfBirthFocusNode,
                      keyboardType: TextInputType.number,
//                                      maxLength: 13,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Quicksand',
                      ),
                      onFieldSubmitted: (_) {
                        // FocusScope.of(context).requestFocus(_bioFocusNode);
                      },
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'Input cannot be empty';
                        } else if (value.trim().contains(RegExp('[^A-Za-z0-9]'))) {
                          return 'Input cannot contain special characters';
                        }
                        // id = value;
                        return null;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand',
                              fontSize: 14),
                          helperText: 'For internal use only.',
                          labelText: 'Identity Number'),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 3,
                            child: ListTile(
                              title: const Text(
                                'Admin',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand',
                                    fontSize: 12),
                              ),
                              leading: Radio(
                                value: UserType.administrator,
                                // groupValue: _job,
                                onChanged: (UserType value) {
                                  setState(() {
                                    // _job = value;
                                    // _jobtype = "FullTime";
                                  });
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: ListTile(
                              title: const Text(
                                'Capturer',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand',
                                    fontSize: 12),
                              ),
                              leading: Radio(
                                value: UserType.general,
                                // groupValue: _job,
                                onChanged: (UserType value) {
                                  setState(() {
                                    // _job = value;
                                    // _jobtype = "PartTime";
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 45, right: 45),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Quicksand',
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w700),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 45, right: 45),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Quicksand',
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w700),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 39.0, right: 39.0, bottom: 20.0),
                    child: DesignButton(
                      description: 'SAVE',
                      isActive: true,
                      function: () {
                        // _saveForm(currentIndex, 'save', context);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
