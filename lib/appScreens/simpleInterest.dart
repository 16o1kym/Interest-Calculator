import 'package:flutter/material.dart';


class SimpleInterest extends StatefulWidget {
  @override
  _SimpleInterestState createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  var _currentItemSelected = 'Rupees';

  var displayResult = "";

  var _formkey = GlobalKey<FormState>();

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff06bee1),
        accentColor: Color(0xff99e1d9),
      ),
      title: "Interest Calculator",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0b132b),
          title: Center(
            child: Text(
              "Simple Interest Calculator",
              style: TextStyle(
                  fontWeight: FontWeight.w900, color: Color(0xff5bc0be)),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffc4fff9), Color(0xffffffff)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Form(
            key: _formkey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Image.asset(
                    "images/bank.png",
                    height: 200.0,
                    width: 200.0,
                    semanticLabel: "bank.png",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter principal amount';
                      }
                    },
                    controller: principalController,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        labelText: 'Principal Amount',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter rate of interest';
                      }
                    },
                    controller: roiController,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        labelText: 'Rate of Interest',
                        hintText: 'In percent',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 20.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextFormField(
                              validator: (String value){
                                if(value.isEmpty){
                                  return 'Please enter time';
                                }

                              },

                              controller: termController,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'Term',
                                  hintText: 'Time in years',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0))),
                            )),
                        Container(width: 25.0),
                        Expanded(
                            child: DropdownButton<String>(
                              items: _currencies.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              value: _currentItemSelected,
                              onChanged: (String newValueSelected) {
                                _onDropDownItemSelected(newValueSelected);
                              },
                            ))
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Color(0xff0b132b),
                          textColor: Color(0xff99e1d9),
                          child: Text(
                            "Calculate",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_formkey.currentState.validate()) {
                                this.displayResult = _calculateTotalReturns();
                              }
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 15.0,
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Color(0xffffffff),
                          child: Text(
                            "Clear",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              _reset();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(this.displayResult),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result =
        "After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected";
    return result;
  }

  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentItemSelected = _currencies[0];

  }
}
