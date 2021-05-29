import 'package:flutter/material.dart';
import 'package:oecasapp/constants/CrudModel.dart';
import 'package:oecasapp/constants/functions.dart';
import 'package:oecasapp/custom_models.dart';
import 'package:oecasapp/custom_views.dart';
// import '../widgets/button.dart';
import 'package:flushbar/flushbar.dart';
import '../custom_widgets.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  static const routeName = '/sign-in';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _form = GlobalKey<FormState>();
  CrudModel _crudModel = new CrudModel();
  Functions _function =  new Functions();
  User userExists;
  bool isLoading = false;

  var _numberFocusNode = FocusNode();
  var _passwordFocusNode = FocusNode();

  var _numberController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _login() async {
    Navigator.of(context).pushReplacementNamed(LandingPage.routeName);
    //setState(() { isLoading = true; });
    // var isValid = _form.currentState.validate();
    // if (!isValid) {
    //   return null;
    // } else {
    //   userExists = await _crudModel.getUser(_numberController.text);
    //   if( userExists.mobileNumber == _numberController.text && userExists.password == _passwordController.text){
    //     Provider.of<Users>(context).getUser(userExists);
    //     setState(() { isLoading = false; });
    //     _function.savePreferences(userExists).then((value) => {
    //       Navigator.of(context).pushReplacementNamed(LandingPage.routeName)
    //     });
    //   } else {
    //     Flushbar(
    //       backgroundGradient: LinearGradient(colors: [Colors.red, Colors.red]),
    //       backgroundColor: Colors.red,
    //       messageText: Text(
    //         'Incorrect credentials.',
    //         style: TextStyle(fontFamily: 'Quicksand', color: Colors.white),
    //         textAlign: TextAlign.center,
    //       ),
    //       duration: Duration(seconds: 5),
    //       flushbarStyle: FlushbarStyle.FLOATING,
    //       borderRadius: 5,
    //       margin: EdgeInsets.all(15),
    //       padding: EdgeInsets.all(15),
    //       flushbarPosition: FlushbarPosition.TOP,
    //     ).show(context).then((value) => {setState(() { isLoading = false; })});
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image( image: AssetImage('assets/images/pngtree.jpeg'), width: deviceSize.width * 0.6, height: 180,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text('Welcome to \nOecasApp', style: TextStyle(fontFamily: 'Anton', letterSpacing: 2, fontSize: 18), textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0, right:  45.0),
                    child: Form(
                      key: _form,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0, left: 2, right: 2),
                              child: TextFormField(
                                controller: _numberController,
                                focusNode: _numberFocusNode,
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                                },
                                validator: (value) {
                                  if (value.trim().isEmpty) {
                                    return 'Input cannot be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Quicksand',
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0, left: 2, right: 2),
                              child: TextFormField(
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                validator: (value) {
                                  if (value.trim().isEmpty) {
                                    return 'Input cannot be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      fontSize: 12,
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
                            DesignButton(description: isLoading ? 'SIGNING IN...' : 'SIGN IN', isActive: true, function: () => { _login() })
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
