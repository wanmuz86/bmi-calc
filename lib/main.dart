import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BmiCalcPage(),
    );
  }
}

class BmiCalcPage extends StatefulWidget {
  @override
  _BmiCalcPageState createState() => _BmiCalcPageState();
}

class _BmiCalcPageState extends State<BmiCalcPage> {
  double weight = 65;
  double height = 170;
  double bmi = 0;
  String message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calc"),
        ),
        body: Column(
          children: <Widget>[
            Text(
              "BMI Calculator",
              style: TextStyle(color: Colors.red, fontSize: 40),
            ),
            Image.asset(
              "assets/heart.jpg",
              height: 80,
            ),
            Text(
              "We care about your health",
              style: TextStyle(fontSize: 32),
            ),
            Text(
              "Height (${height.toStringAsFixed(0)} cm)",
              style: TextStyle(fontSize: 24),
            ),
            Slider(
                min: 100,
                max: 220,
                value: height,
                onChanged: (double value) {
//CHange the state
                  setState(() {
                    height = value;
                  });
                }),
            Text(
              "Weight - (${weight.toStringAsFixed(0)} kg)",
              style: TextStyle(fontSize: 24),
            ),
            Slider(
              min: 50,
              max: 150,
              value: weight,
              onChanged: (double value) {
                setState(() {
                  weight = value;
                });
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.favorite),
              color: Colors.redAccent,
              textColor: Colors.white,
              label: Text("Calculate"),
              onPressed: () {
                var bmiCalc = weight / ((height/100) * (height/100));
                var messageTemp = "";
                if (bmiCalc < 18.5){
                  messageTemp = "You are underweight";
                }
                else if (bmiCalc < 25) {
                  messageTemp = "You are normal";
                }
                else if (bmiCalc < 30) {
                  messageTemp = "You are overweight";
                }
                else {
                  messageTemp = "You are obese";
                }
                setState(() {
                  bmi = bmiCalc;
                  message = messageTemp;
                });
              },
            ),
            //ternary operator
            bmi > 0 ? Text("Your BMI is ${bmi.toStringAsFixed(1)}. $message") :
                Text("")
          ],
        ));
  }
}
