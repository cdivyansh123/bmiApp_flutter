import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'YOUR BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();

  var result = "";

  var bgcolor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: wtcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Enter your weight (in kg)'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: ftcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Enter your height (in feet)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: incontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Enter your height (in inches)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtcontroller.text;
                        var ft = ftcontroller.text;
                        var inch = incontroller.text;

                        if (wt != "" && ft != "" && inch != "") {
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var ic = int.parse(inch);

                          var tinch = (ift * 12) + ic;
                          var tcm = tinch * 2.54;
                          var tm = tcm / 100;

                          var bmi = iwt / (tm * tm);

                          var msg = "";
                          if (bmi > 25) {
                            msg = "you are overweight";
                            bgcolor = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            msg = "you are underweight";
                            bgcolor = Colors.red.shade200;
                          } else {
                            msg = "you are healthy";
                            bgcolor = Colors.green.shade200;
                          }
                          setState(() {
                            result =
                                "$msg \n your BMI IS ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = "please fill all the details";
                          });
                        }
                      },
                      child: Text('calculate')),
                  SizedBox(
                    height: 21,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 21, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
