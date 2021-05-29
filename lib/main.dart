import 'package:flutter/material.dart';
import 'package:oecasapp/constants/locator.dart';
import 'custom_models.dart';
import 'custom_views.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  setupLocator();
  runApp(OecasApp());
}

class OecasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OecasApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'OecasApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  User user;
  _onLoad()  async {
    await SharedPreferences.getInstance().then((shared){
      bool containsUserData = shared.containsKey('userData');
      if(containsUserData) {
        var _sharedPreferences = json.decode(shared.getString('userData')) as Map<String, Object>;
        user = User(id: _sharedPreferences['id'], name: _sharedPreferences['name'], type: _sharedPreferences['type'], mobileNumber: _sharedPreferences['mobileNumber'], password: _sharedPreferences['password']);
        setState(() {});
        Provider.of<Users>(context).getUser(user);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _onLoad();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    var isSignedIn = user == null;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Users()),
      ],
      child: Consumer<Users>(
        builder: (context, user, _) => MaterialApp(
          title: widget.title,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Colors.pink,
            accentColor: Colors.blue,
            fontFamily: 'Quicksand'
          ),
          debugShowCheckedModeBanner: false,
          home: isSignedIn ? SignIn() : LandingPage(),
          routes: {
            SignIn.routeName: (context) => SignIn(),
            LandingPage.routeName: (context) => LandingPage(),
            RegisterUser.routeName: (context) => RegisterUser(),
            Questionnaire.routeName: (context) => Questionnaire()
          },
        ),
      ),
    );
  }
}
