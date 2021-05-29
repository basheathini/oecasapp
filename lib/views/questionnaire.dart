import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oecasapp/custom_widgets.dart';
import '../custom_widgets.dart';
class Questionnaire extends StatefulWidget {
  static const routeName = '';
  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {

  List<bool> _selections = List.generate(3, (_) => false);
  String dropdownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selections[0] = true;
  }
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    var leftSize = ((deviceSize.width - 80.0) / 3).toDouble() - 4.0;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
        body: Container(
          color: Colors.white,
          height: deviceSize.height,
          width: deviceSize.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ToggleButtons(
                  color: Theme.of(context).primaryColor,
                  selectedBorderColor: Colors.green,
                  hoverColor: Theme.of(context).accentColor,
                  children: [
                    Container(
                        width: leftSize.toDouble(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_outlined, size: 16,),
                            Text('Location', style: TextStyle(fontSize: 8),),
                          ],
                        )),
                    Container(
                        width: leftSize.toDouble(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person_outline, size: 16,),
                            Text('Personal', style: TextStyle(fontSize: 8),),
                          ],
                        )),
                    Container(
                        width: leftSize.toDouble(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.medical_services_outlined, size: 14,),
                            Text('Medical', style: TextStyle(fontSize: 8),),
                          ],
                        )),
                  ],
                  onPressed: (int index) {
                    // _saveForm(index, 'navigation', context);
                  },
                  isSelected: _selections,
                ),
                SizedBox(
                  height: 20,
                ),
                _selections[0] ? address(context, deviceSize) : _selections[1] ? personalInformation(context, deviceSize) : medicalHistory(context, deviceSize)
              ],
            ),
          ),
        )

    );
  }


  Column address(BuildContext context, Size deviceSize) {
    return Column(
      children: <Widget>[
        Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 45.0,
                right: 45.0,
                top: 18.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(
                        fontSize: 16, fontFamily: 'Quicksand'),
                    onFieldSubmitted: (_) {
                      // FocusScope.of(context).requestFocus(_suburbFocusNode);
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Input cannot be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 14),
                        labelText: 'Street Address'),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton<String>(
                            value: dropdownValue,
                            isExpanded: true,
                            hint: Text('Please select province', style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontSize: 14),),
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>['Eastern Cape', 'Free State', 'Gauteng',
                              'KwaZulu-Natal', 'Limpopo', 'Mpumalanga', 'North West', 'Northern Cape', 'Western Cape'].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>( value: value, child: Text(value, style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                    fontSize: 14),),);
                              }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(
                        fontSize: 16, fontFamily: 'Quicksand'),
                    onFieldSubmitted: (_) {
                      // FocusScope.of(context).requestFocus(_suburbFocusNode);
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Input cannot be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 14),
                        labelText: 'Country'),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 18.0,bottom: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                          fontSize: 16, fontFamily: 'Quicksand'),
                      onFieldSubmitted: (_) {
                        // FocusScope.of(context).requestFocus(_suburbFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Input cannot be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize: 14),
                          labelText: 'Postal Code'),
                    ),
                  ),

                  DesignButton(
                    isActive: true, function: () {}, description: 'Next',
                  )

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


  Column personalInformation(BuildContext context, Size deviceSize) {
    return Column(
      children: <Widget>[
        Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 45.0,
                right: 45.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


  Column medicalHistory(BuildContext context, Size deviceSize) {
    return Column(
      children: <Widget>[
        Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 45.0,
                right: 45.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
