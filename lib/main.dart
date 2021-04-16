import 'package:flutter/material.dart';
import 'package:oecasapp/models/user.dart';
import 'package:oecasapp/views/sign_in.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(OecasApp());
}

class OecasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OecasApp',
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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: User()),
      ],
      child: Consumer<User>(
        builder: (context, user, _) => MaterialApp(
          title: widget.title,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Colors.white,
            accentColor: Colors.blue,
            fontFamily: 'Quicksand'
          ),
          debugShowCheckedModeBanner: false,
          home: SignIn(),
          routes: {
            SignIn.routeName: (context) => SignIn()
          },
        ),
      ),
    );
  }
}
