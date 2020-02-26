import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController x1 = TextEditingController();
  final TextEditingController x2 = TextEditingController();
  final TextEditingController y1 = TextEditingController();
  final TextEditingController y2 = TextEditingController();

  double num1, num2, den1, den2, num3 = 0, den3 = 0;
  int num4 = 0, den4 = 0;

  List<String> _operation = ['+', '-', '×', '÷'];
  String _currentItemSelected = '+';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple[800],
        accentColor: Colors.amber,
      ),
      title: 'LAB 1',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('FRACTION CALCULATOR'),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(children: [
                  SizedBox(
                    width: 55,
                  ),
                  new Container(
                      width: 100.0,
                      child: new TextField(
                          controller: x1,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'x\u2081',
                          ),
                          style: new TextStyle(
                            fontSize: 24.0,
                            height: 2.0,
                          ))),
                  SizedBox(
                    width: 85,
                  ),
                  new Container(
                      width: 100.0,
                      child: new TextField(
                          controller: x2,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'x\u2082',
                          ),
                          style: new TextStyle(
                            fontSize: 22.0,
                            height: 2.0,
                          ))),
                ]),
                Row(
                  children: [
                    SizedBox(
                      width: 55,
                    ),
                    Text('_______________'),
                    SizedBox(
                      width: 22,
                    ),
                    new DropdownButton<String>(
                      items: _operation.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (newValueSelected) {
                        _onDropDownItemSelected(newValueSelected);
                      },
                      value: _currentItemSelected,
                      style: TextStyle(fontSize: 30),
                      underline: Container(
                        height: 2,
                        color: Colors.amber,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('_______________'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  SizedBox(
                    width: 55,
                  ),
                  new Container(
                      width: 100.0,
                      child: new TextField(
                          controller: y1,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'y\u2081',
                          ),
                          style: new TextStyle(
                            fontSize: 22.0,
                            height: 2.0,
                          ))),
                  SizedBox(
                    width: 85,
                  ),
                  new Container(
                      width: 100.0,
                      child: new TextField(
                          controller: y2,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'y\u2082',
                          ),
                          style: new TextStyle(
                            fontSize: 22.0,
                            height: 2.0,
                          ))),
                ]),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                    ),
                    RaisedButton(
                      onPressed: _onPress,
                      color: Color(0x00000000),
                      padding: new EdgeInsets.all(0.0),
                      child: Container(
                        decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(5.0)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xFF6200EA),
                              Color(0xFF7C4DFF),
                              Color(0xFFB388FF),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('CALCULATE',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    RaisedButton(
                      onPressed: _reset,
                      color: Color(0x00000000),
                      padding: new EdgeInsets.all(0.0),
                      child: Container(
                        decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(5.0)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xFF6200EA),
                              Color(0xFF7C4DFF),
                              Color(0xFFB388FF),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child:
                            const Text('RESET', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 100.00,
                  height: 80.00,
                  child: new DecoratedBox(
                      decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(5.0)),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        ),
                      ),
                      // Put Your Child widget here.
                      child: new Center(
                        child: new Text(
                          '$num4',
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                      )),
                ),
                Row(children: [
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('________________'),
                ]),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 100.00,
                  height: 80.00,
                  child: new DecoratedBox(
                      decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(5.0)),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        ),
                      ),
                      // Put Your Child widget here.
                      child: new Center(
                        child: new Text(
                          '$den4',
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _reset() {
    setState(() {
      x1.text = "";
      x2.text = "";
      y1.text = "";
      y2.text = "";
      num3 = 0;
      den3 = 0;
      num4 = 0;
      den4 = 0;
    });
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
      print(newValueSelected);
    });
  }

  void _onPress() {
    setState(() {
      print('Calculating');

      num1 = double.parse(x1.text);
      num2 = double.parse(x2.text);
      den1 = double.parse(y1.text);
      den2 = double.parse(y2.text);

      if (_currentItemSelected == '+') {
        den3 = fraction(den1, den2);
        num3 = (num1 * den2) + (den1 * num2);
        den3 = den1 * den2;
      } else if (_currentItemSelected == '-') {
        den3 = fraction(den1, den2);
        num3 = (num1 * den2) - (den1 * num2);
        den3 = den1 * den2;
      } else if (_currentItemSelected == '×') { 
        den3 = fraction(den1, den2);
        num3 = num1 * num2;
        den3 = den1 * den2;
      } else if (_currentItemSelected == '÷') {
        den3 = fraction(den1, den2);
        num3 = num1 * den2;
        den3 = den1 * num2;
      }
      simplestform();
    });
  }

  double fraction(double a, double b) {
    if (a == 0) {
      return b;
    } else {
      return fraction(b % a, a);
    }
  }

  void simplestform() {
    double commonFactor = fraction(num3, den3);
    den3 = den3 / commonFactor;
    num3 = num3 / commonFactor;

num4 = num3.round();
den4 = den3.round();


  }
}
