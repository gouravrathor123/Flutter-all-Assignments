import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String ans = '0';
  String operations = '';

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double height = mediaQueryData.size.height;
    double width = mediaQueryData.size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: (height / 3) - 25,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      operations,
                      style:
                          (const TextStyle(color: Colors.white, fontSize: 32)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      ans,
                      style:
                          (TextStyle(color: HexColor("#059e2e"), fontSize: 40)),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.red,
              ),
              SizedBox(
                width: width,
                height: (2 * height) / 15,
                child: Container(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations = "";
                                ans = "0";
                              });
                            },
                            child: const Text(
                              "C",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations = operations.substring(
                                    0, operations.length - 1);
                                if(operations[operations.length-1]!='*' && operations[operations.length-1]!='-' && operations[operations.length-1]!='+' && operations[operations.length-1]!='/' && operations[operations.length-1]!='.'){
                                  dothecalculation(operations);
                                }
                                else{
                                  String cal=operations.substring(0, operations.length - 1);
                                  dothecalculation(cal);
                                }
                              });
                            },
                            child: const Icon(Icons.backspace_outlined,
                                color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '%';
                              });
                            },
                            child: const Text(
                              "%",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '/';
                              });
                            },
                            child: const Text(
                              "/",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: (2 * height) / 15,
                child: Container(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '7';
                                dothecalculation(operations);
                              });
                            },
                            child: const Text(
                              "7",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '8';
                                dothecalculation(operations);
                              });
                            },
                            child: const Text(
                              "8",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '9';
                                dothecalculation(operations);
                              });
                            },
                            child: const Text(
                              "9",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '*';
                              });
                            },
                            child: const Text(
                              "*",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: (2 * height) / 15,
                child: Container(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '4';
                                dothecalculation(operations);
                              });
                            },
                            child: const Text(
                              "4",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '5';
                                dothecalculation(operations);
                              });
                            },
                            child: const Text(
                              "5",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '6';
                                dothecalculation(operations);
                              });
                            },
                            child: const Text(
                              "6",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '-';
                              });
                            },
                            child: const Text(
                              "-",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: (2 * height) / 15,
                child: Container(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '1';
                                dothecalculation(operations);
                              });
                            },
                            child: const Text(
                              "1",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '2';
                                dothecalculation(operations);
                              });
                            },
                            child: const Text(
                              "2",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '3';
                                dothecalculation(operations);
                              });
                            },
                            child: const Text(
                              "3",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '+';
                              });
                            },
                            child: const Text(
                              "+",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: (2 * height) / 15,
                child: Container(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "+/-",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '0';
                                dothecalculation(operations);
                              });
                            },
                            child: const Text(
                              "0",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                operations += '.';
                              });
                            },
                            child: const Text(
                              ".",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                dothecalculation(operations);
                              });
                            },
                            child: const Text(
                              "=",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              primary: const Color(0xFF283637),
                              // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dothecalculation(String givenstring){
    try {
      Parser p = Parser();
      Expression exp = p.parse(givenstring);
      ContextModel cm = ContextModel();
      ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
    } catch (e) {
      ans = "Error";
    }
  }
}
