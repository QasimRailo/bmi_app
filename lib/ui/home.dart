import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _age = new TextEditingController();
  final TextEditingController _height = new TextEditingController();
  final TextEditingController _weight = new TextEditingController();
  double _hc = 0.0;
  double bmi = 0.0;
  String finalbmi;
  void calculate() {
    //height in Centimeteres
    setState(() {
      _hc = (double.parse(_height.text.toString())) * 30.48;
      bmi = (double.parse(_weight.text.toString()) / (_hc * _hc)) * 10000;
    });
    // return bmi;
    finalbmi = "Your BMI is ${bmi.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2),
          children: <Widget>[
            new Image.asset(
              "images/bmi.png",
              height: 180,
              width: 180,
            ),
            new Container(
              color: Colors.black12,
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _age,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Age",
                        // hintText: "In POUNDS",
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.5)),
                  new TextField(
                    controller: _height,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height in Feet",
                        //  hintText: "In POUNDS",
                        icon: new Icon(Icons.insert_chart)),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.5)),
                  new TextField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Weight in KGs",
                        // hintText: "In POUNDS",
                        icon: new Icon(Icons.line_weight)),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.5)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.pinkAccent,
                      onPressed: calculate,
                      child: Text(
                        'Calculate',
                        style: new TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 23),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Padding(
              padding: EdgeInsets.all(8.0),
              child: new Text(
                finalbmi != null ? finalbmi : "Please Fill All Fields",
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
