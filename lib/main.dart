import "package:flutter/material.dart";

void main() => runApp(Simple());

class Simple extends StatefulWidget {
  @override
  _SimpleState createState() => _SimpleState();
}

class _SimpleState extends State<Simple> {
  var _curruncies = ['Rupees', 'Doller', 'Other'];
  var _newSelected = 'Rupees';
  String _finalResult = '';

  TextEditingController principlecontroller = new TextEditingController();
  TextEditingController roicontroller = new TextEditingController();
  TextEditingController termcontroller = new TextEditingController();

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Interest App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Color(0xFFFFD600),
          fontFamily: 'GoogleSans'),
      home: Scaffold(
        backgroundColor: Color(0xFF37474F),
        appBar: AppBar(
          title: Text(
            "Simple Interest Calculator",
            style: TextStyle(
                color: Color(0xFF37474F), fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xFFFFD600),
          elevation: 10,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                    child: Container(
                        margin: EdgeInsets.all(20),
                        child: Image.asset("assets/img/1.png", width: 130))),
                Padding(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 10),
                    child: TextFormField(
                      controller: principlecontroller,
                      keyboardType: TextInputType.number,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return '*Please enter Principle value';
                        }
                      },
                      decoration: InputDecoration(
                          errorStyle:
                              TextStyle(fontSize: 15, color: Color(0xFFFFD600)),
                          labelText: "Principle",
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'GoogleSans',
                              fontWeight: FontWeight.bold),
                          hintText: "Enter Principle Eg. 1200",
                          hintStyle: TextStyle(
                              color: Colors.white, fontFamily: 'GoogleSans'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Color(0xFFFFD600))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Color(0xFFFFD600))),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.yellow))),
                    )),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                  child: TextFormField(
                      controller: roicontroller,
                      keyboardType: TextInputType.number,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return '*Please enter Rate of Interest';
                        }
                      },
                      decoration: InputDecoration(
                          errorStyle:
                              TextStyle(color: Color(0xFFFFD600), fontSize: 15),
                          labelText: "Rate of Interest",
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'GoogleSans',
                              fontWeight: FontWeight.bold),
                          hintText: "In Percent",
                          hintStyle: TextStyle(
                              color: Colors.white, fontFamily: 'GoogleSans'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Color(0xFFFFD600))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Color(0xFFFFD600))),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.yellow)))),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextFormField(
                        controller: termcontroller,
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return '*Please enter Term';
                          }
                        },
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                                color: Color(0xFFFFD600), fontSize: 15),
                            labelText: "Term",
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'GoogleSans',
                                fontWeight: FontWeight.bold),
                            hintText: "In Years",
                            hintStyle: TextStyle(
                                color: Colors.white, fontFamily: 'GoogleSans'),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.yellow))),
                      )),
                      Container(
                        width: 20,
                      ),
                      Expanded(
                          child: DropdownButton<String>(
                              items: _curruncies.map((String value) {
                                return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontWeight: FontWeight.bold),
                                    ));
                              }).toList(),
                              value: _newSelected,
                              onChanged: (String newValue) {
                                setState(() {
                                  this._newSelected = newValue;
                                });
                              }))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            width: 160,
                            child: RaisedButton(
                                color: Color(0xFFFFD600),
                                child: Text(
                                  "Calculate",
                                  style: TextStyle(
                                      color: Color(0xFF37474F),
                                      fontSize: 17,
                                      fontFamily: 'GoogleSans'),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_formKey.currentState.validate()) {
                                      _finalResult = _calculateResult();
                                    }
                                  });
                                }),
                          ),
                        ),
                        Container(
                          width: 15,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 160,
                            child: RaisedButton(
                                color: Color(0xFF37474F),
                                child: Text(
                                  "Reset",
                                  style: TextStyle(
                                      color: Color(0xFFFFD600),
                                      fontSize: 17,
                                      fontFamily: 'GoogleSans'),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _reset();
                                  });
                                }),
                          ),
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    _finalResult,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'GoogleSans', fontSize: 15),
                  ),
                ),
                Container(
                  height: 50,
                ),
                Container(
                    child: Text(
                  "Made by",
                  textAlign: TextAlign.center,
                )),
                Container(
                    margin: EdgeInsets.only(top: 5, bottom: 15),
                    child: Text(
                      "Akshay Sargar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'GoogleSans',
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _calculateResult() {
    double principle = double.parse(principlecontroller.text);
    double roi = double.parse(roicontroller.text);
    double term = double.parse(termcontroller.text);

    double totalPayableAmount = principle + (principle * roi * term) / 100;
    String result =
        "After $term years, your investment will be worth $totalPayableAmount $_newSelected";
    return result;
  }

  void _reset() {
    principlecontroller.text = '';
    roicontroller.text = '';
    termcontroller.text = '';
    _finalResult = '';
    _newSelected = _curruncies[0];
  }
}
