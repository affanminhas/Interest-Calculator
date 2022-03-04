import 'dart:ui';

import 'package:flutter/material.dart';
import 'textfield.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Interest Calculator",
    home: SIForm(),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();
  var _currencies = ["Rupee", "Pound", "Dollar"];
  var _currentItemSelected = "Rupee";
  var displayResult = "";

  // ------ Initializing To Fetch out data from textField ------
  TextEditingController principalcontrolled = TextEditingController();
  TextEditingController roicontrolled = TextEditingController();
  TextEditingController termcontrolled = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF191720),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Interest Calculator",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            getImageAssest(),
            AppTextField(
              placeholder: "priciple e.g 1200",
              label: "Principle",
              controller: principalcontrolled,
            ),
            AppTextField(
              placeholder: "Interest",
              label: "Rate of Interest",
              controller: roicontrolled,
            ),
            AppTextField(
              placeholder: "Term",
              label: "Time in years",
              controller: termcontrolled,
            ),
            Center(
              child: Expanded(
                child: DropdownButton<String>(
                    items: _currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _currentItemSelected,
                    dropdownColor: Color(0xFF1E1C24),
                    onChanged: (String? newValueSelected) {
                      _onDropDownItemSelected(newValueSelected);
                    },
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: RaisedButton(
                        child: Text(
                          "Calculate",
                          style: TextStyle(
                              fontFamily: "Poppins", fontWeight: FontWeight.w500),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState!.validate()){
                              displayResult = _calculateTotalReturn();
                            }
                          });
                        },
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  //SizedBox(height: 5,width: 5),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15),

                      child: RaisedButton(
                        child: Text("Reset",style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500
                        ),),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          setState(() {
                            _reset();
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                displayResult,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getImageAssest() {
    AssetImage assetImage = AssetImage("images/bankpic.png");
    Image image = Image(
      image: assetImage,
      width: 175,
      height: 175,
    );
    return Container(
      child: image,
      // alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
    );
  }

  void _onDropDownItemSelected(String? newValueSelected) {
    setState(() {
      _currentItemSelected = newValueSelected!;
    });
  }

  String _calculateTotalReturn() {
    double principal = double.parse(principalcontrolled.text);
    double roi = double.parse(roicontrolled.text);
    double term = double.parse(termcontrolled.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result =
        "After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected";
    return result;
  }

  void _reset() {
    principalcontrolled.text = "";
    roicontrolled.text = "";
    termcontrolled.text = "";
    displayResult = "";
    _currentItemSelected = _currencies[0];
  }
}
