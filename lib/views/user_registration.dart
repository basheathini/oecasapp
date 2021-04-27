import 'package:flutter/material.dart';
import 'package:oecasapp/constants/functions.dart';
import 'package:oecasapp/custom_models.dart';
import 'package:oecasapp/custom_views.dart';
import 'package:oecasapp/custom_widgets.dart';
import 'package:provider/provider.dart';
class RegisterUser extends StatefulWidget {
  static const routeName = '/register-user';
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

enum UserType { administrator, general }
class _RegisterUserState extends State<RegisterUser> {

  var _form = GlobalKey<FormState>();

  var _firstNameFocusNode = FocusNode();
  var _lastNameFocusNode = FocusNode();
  var _numberFocusNode = FocusNode();
  var _passwordFocusNode = FocusNode();
  var _passwordConfirmFocusNode = FocusNode();

  var _firstNameController = TextEditingController();
  var _lastNameController = TextEditingController();
  var _numberController = TextEditingController();
  var _passwordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();


  UserType _userType = UserType.administrator;
  String userType = 'administrator';
  Functions _functions = new Functions();

  _saveForm(BuildContext context) {
    var isValid = _form.currentState.validate();
    if (!isValid) {
      return null;
    } else {
      User user = User(id: _numberController.text, name: _firstNameController.text, type: userType, mobileNumber: _numberController.text, password: _passwordController.text);
      //_functions.saveOffline(user);
      Provider.of<Users>(context, listen: false).addUser(user);
    }

  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: AppBarText('User Registration'),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: Container(
        color: Colors.white,
        height: deviceSize.height,
        width: deviceSize.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _form,
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
                                  // initialValue: _firstNameController.text.isEmpty ? '' : _firstNameController.text,
                                  textCapitalization: TextCapitalization.sentences,
                                  controller: _firstNameController,
                                  textInputAction: TextInputAction.next,
                                  focusNode: _firstNameFocusNode,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Quicksand',
                                  ),
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(_lastNameFocusNode);
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
                                  // initialValue: _lastNameController.text.isEmpty ? '' : _lastNameController.text,
                                  controller: _lastNameController,
                                  textCapitalization: TextCapitalization.sentences,
                                  textInputAction: TextInputAction.next,
                                  focusNode: _lastNameFocusNode,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Quicksand',
                                  ),
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(_numberFocusNode);
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
                        // initialValue: _identityNumberController.text.isNotEmpty ? _identityNumberController.text : '',
                        controller: _numberController,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        focusNode: _numberFocusNode,
                        keyboardType: TextInputType.number,
                        // maxLength: 13,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Quicksand',
                        ),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_passwordFocusNode);
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
                            // helperText: 'For internal use only.',
                            labelText: 'Mobile Number'),
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
                                  groupValue: _userType,
                                  onChanged: (UserType value) {
                                    setState(() {
                                      _userType = value;
                                      userType = 'administrator';
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
                                  groupValue: _userType,
                                  onChanged: (UserType value) {
                                    setState(() {
                                      _userType = value;
                                      userType = 'general';
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
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_passwordConfirmFocusNode);
                        },

                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Input cannot be empty';
                          }else if(_confirmPasswordController.text != _passwordController.text){
                            return 'Password does not match';
                          }
                          // id = value;
                          return null;
                        },
                        focusNode: _passwordFocusNode,
                        // initialValue:_passwordController.text.isNotEmpty ? _passwordController.text : '',
                        controller: _passwordController,
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
                        focusNode: _passwordConfirmFocusNode,
                        // initialValue: _confirmPasswordController.text.isNotEmpty ? _confirmPasswordController.text : '',
                        controller: _confirmPasswordController,

                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Input cannot be empty';
                          }else if(_confirmPasswordController.text != _passwordController.text){
                            return 'Password does not match';
                          }
                          // id = value;
                          return null;
                        },
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
                          _saveForm(context);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
