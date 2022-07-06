import 'package:calculator_v2/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController finalDisplay = TextEditingController();
  num? result;
  String? firstOperand;
  String? secondOperand;

  // double? firstDoubleOperand;
  // double? secondDoubleOperand;
  String? operator;
  bool isResultShown = false;
  bool isResultDouble = false;

  onBackSpacePressed() {
    setState(() {
      if (result != null) {
        result = double.parse(
            result.toString().substring(0, result.toString().length - 1));
      } else if (secondOperand != null) {
        if (secondOperand.toString().length == 1) {
          secondOperand = null;
        } else {
          secondOperand = int.parse(secondOperand
              .toString()
              .substring(0, secondOperand.toString().length - 1)) as String?;
        }
      } else if (operator != null) {
        operator = null;
      } else if (firstOperand != null) {
        if (firstOperand.toString().length == 1) {
          firstOperand = '';
        } else {
          firstOperand = firstOperand
              .toString()
              .substring(0, firstOperand.toString().length - 1);
          // int.parse(firstOperand
          //     .toString()
          //     .substring(0, firstOperand.toString().length - 1));
        }
      }
    });
    finalDisplay.text = _getDisplayText();
  }

  onNumberPressed(var number) {
    setState(() {
      isResultShown = false;

      if (result != null) {
        result = null;
        firstOperand = number;
        return;
      }

      if (firstOperand == null) {
        firstOperand = '$number';
        return;
      }

      if (operator == null) {
        firstOperand = '$firstOperand$number';
        // int.parse('$firstOperand$number');
        return;
      }

      if (secondOperand == null) {
        secondOperand = number.toString();
        return;
      }

      secondOperand = double.parse('$secondOperand$number').toString();
    });
    finalDisplay.text = _getDisplayText();
  }

  onOpratorPressed(String operator) {
    setState(() {
      isResultShown = false;
      // firstOperand ??= 0;
      // result = null;
      firstOperand ??= '0';

      this.operator = operator;
    });
    finalDisplay.text = _getDisplayText();
  }

  calculateResult() {
    if (operator == null || secondOperand == null) {
      return;
    }
    setState(() {
      switch (operator) {
        case '+':
          result = double.parse(firstOperand.toString()) +
              double.parse(secondOperand.toString());
          break;
        case '-':
          result = double.parse(firstOperand.toString()) -
              double.parse(secondOperand.toString());
          break;
        case '*':
          result = double.parse(firstOperand.toString()) *
              double.parse(secondOperand.toString());
          break;
        case '/':
          if (secondOperand == 0) {
            return;
          }
          print('result called');
          result = (double.parse(firstOperand.toString()) /
              double.parse(secondOperand.toString()));
          break;
      }

      if (result!.toStringAsFixed(2).contains(RegExp(r'\.0+$'))) {
        result = double.parse(
            result!.toStringAsFixed(2).replaceFirst(RegExp(r'\.0+$'), ''));
        //   firstDoubleOperand = null;
      } else {
        firstOperand = result.toString();
        // double.parse(result!.toStringAsFixed(2));
      }
      // firstOperand = result as String?;
      operator = null;
      secondOperand = null;
      // secondDoubleOperand = null;
      result = null;
      isResultShown = true;
    });

    finalDisplay.text = _getDisplayText();
  }

  String _getDisplayText() {
    if (result != null) {
      return '$result';
    }

    if (secondOperand != null) {
      print('secondOperand shown');
      return '$firstOperand $operator $secondOperand';
    }

    // if (operator != null) {
    //   print('firstOperand or firstDoubleOperand and operator shown');
    //   return firstDoubleOperand == null
    //       ? '$firstOperand $operator'
    //       : '$firstDoubleOperand $operator';
    // }

    if (operator != null) {
      return '$firstOperand$operator';
    }

    if (firstOperand != null) {
      print('firstOperand shown');
      return '$firstOperand';
    }

    // if (firstDoubleOperand != null) {
    //   print('first double operand called');
    //   return '$firstDoubleOperand';
    // }

    return '0';
  }

  clear() {
    setState(() {
      result = null;
      operator = null;
      secondOperand = null;
      firstOperand = '';
      // firstDoubleOperand = null;
      // secondDoubleOperand = null;
      finalDisplay.text = '';
    });
  }

  @override
  void initState() {
    finalDisplay.text = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(12),
                height: 100,
                width: double.infinity,
                alignment: isResultShown == true
                    ? Alignment.bottomLeft
                    : Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12),
                child: Text(finalDisplay.text,
                    style: TextStyle(
                      fontSize: 30,
                      color: isResultShown ? Colors.red : Colors.black,
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Button(
                    label: '7',
                    onTap: () {
                      // numberPressed(7);
                      onNumberPressed(7);
                    },
                  ),
                  Button(
                    label: '8',
                    onTap: () {
                      // numberPressed(8);
                      onNumberPressed(8);
                    },
                  ),
                  Button(
                    label: '9',
                    onTap: () {
                      // numberPressed(9);
                      onNumberPressed(9);
                    },
                  ),
                  Button(
                      label: '*',
                      onTap: () {
                        // operatorPressed('*');
                        onOpratorPressed('*');
                      }),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Button(
                    label: '4',
                    onTap: () {
                      // numberPressed(4);
                      onNumberPressed(4);
                    },
                  ),
                  Button(
                    label: '5',
                    onTap: () {
                      // numberPressed(5);
                      onNumberPressed(5);
                    },
                  ),
                  Button(
                      label: '6',
                      onTap: () {
                        // numberPressed(6);
                        onNumberPressed(6);
                      }),
                  Button(
                      label: '/',
                      onTap: () {
                        // operatorPressed('/');
                        onOpratorPressed('/');
                      }),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Button(
                    label: '1',
                    onTap: () {
                      // numberPressed(1);
                      onNumberPressed(1);
                    },
                  ),
                  Button(
                    label: '2',
                    onTap: () {
                      // numberPressed(2);
                      onNumberPressed(2);
                    },
                  ),
                  Button(
                      label: '3',
                      onTap: () {
                        // numberPressed(3);
                        onNumberPressed(3);
                      }),
                  Button(
                      label: '+',
                      onTap: () {
                        // operatorPressed('+');
                        onOpratorPressed('+');
                      }),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Button(
                    label: '=',
                    onTap: () {
                      calculateResult();
                    },
                    backgroundColor: Colors.orange,
                  ),
                  Button(
                    label: '0',
                    onTap: () {
                      // numberPressed(0);
                      onNumberPressed(0);
                    },
                  ),
                  Button(
                      label: 'C',
                      onTap: () {
                        clear();
                      }),
                  Button(
                      label: '-',
                      onTap: () {
                        // operatorPressed('-');
                        onOpratorPressed('-');
                      }),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                      backgroundColor: Colors.red,
                      label: '<--',
                      onTap: () {
                        onBackSpacePressed();
                      }),
                  Button(
                      label: '.',
                      onTap: () {
                        onNumberPressed('.');
                        // setState(() {
                        //   firstOperand = '$firstOperand.0';
                        // });
                        // numberPressed(double.parse('.'));
                        // onNumberPressed('.');
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
