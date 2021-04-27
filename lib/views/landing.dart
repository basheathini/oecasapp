import 'package:flutter/material.dart';
import 'package:oecasapp/custom_widgets.dart';
import 'package:oecasapp/custom_views.dart';
import 'package:oecasapp/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:provider/provider.dart';


class LandingPage extends StatefulWidget {
  static const routeName = 'landing-page';
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var data = Provider.of<Users>(context, listen: true).userData;
    print('------ data2 ${data}');
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: AppBarText('Oecas'),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        height: deviceSize.height,
        width: deviceSize.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/pngtree.jpeg'),
                    width: deviceSize.width * 0.6,
                    height: 200,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(
                        Icons.data_usage_rounded,
                        color: Colors.pink,
                        size: 21,
                      ),
                      title:
                          Text('Data Entry', style: TextStyle(fontFamily: 'Anton', letterSpacing: 1)),
                      onTap: () {
                        // Navigator.of(context).pushNamed(News.routeName);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 58.0, right: 58.0),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.history_rounded,
                        color: Colors.pink,
                        size: 21,
                      ),
                      title: Text('Historical Records',
                          style: TextStyle(fontFamily: 'Anton', letterSpacing: 1)),
                      onTap: () {
                        // Navigator.of(context).pushNamed(News.routeName);
                      },
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 58.0, right: 58.0),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    onTap: () {},
                    splashColor: Colors.pink,
                    child: ListTile(
                      leading: Icon(
                        Icons.person_add_alt_1_outlined,
                        color: Colors.pink,
                        size: 21,
                      ),
                      title:
                      Text('Register user', style: TextStyle(fontFamily: 'Anton', letterSpacing: 1)),
                      onTap: () {
                        Navigator.of(context).pushNamed(RegisterUser.routeName);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 58.0, right: 58.0),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),


                  GestureDetector(
                    onTap: () {

                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.bar_chart_rounded,
                        color: Colors.grey,
                        size: 21,
                      ),
                      title: Text('Statistics (coming soon)', style: TextStyle(fontFamily: 'Anton' , letterSpacing: 1, color: Colors.grey)),
                      onTap: () {
                        // Navigator.of(context).pushNamed(News.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
