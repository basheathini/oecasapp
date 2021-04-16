import 'package:flutter/material.dart';
import 'package:oecasapp/custom_views.dart';
import '../widgets/button.dart';

class SignIn extends StatefulWidget {
  static const routeName = '/sign-in';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _login() async {
    Navigator.of(context).pushReplacementNamed(LandingPage.routeName);
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

                  Image( image: AssetImage('assets/images/pngtree.jpeg'), width: deviceSize.width * 0.6, height: 200,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text('Welcome to \nOecasApp', style: TextStyle(fontFamily: 'Anton', letterSpacing: 2, fontSize: 22), textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right:  40.0),
                    child: Form(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0, left: 2, right: 2),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Quicksand',
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: .8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).accentColor,
                                        width: .8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: .8, color: Colors.grey
                                    ),
                                  ),
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
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Quicksand',
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: .8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).accentColor,
                                        width: .8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(width: .8, color: Colors.grey),
                                  ),
                                ),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w700),
                                obscureText: true,
                              ),
                            ),
                            DesignButton(description: 'SIGN IN', isActive: true, function: () => { _login() })
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
