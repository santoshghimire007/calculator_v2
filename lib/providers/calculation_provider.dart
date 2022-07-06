

// import 'package:flutter/material.dart';

// class CalculateProvider extends ChangeNotifier {
  
//   double? result ;
//   String? firstOperand;
//   String? secondOperand;
//   String? operator;

//   onNumberPressed(String number) {
//     if (result != null) {
//       result = null;
//       firstOperand = number;
//       return;
//     }
//     if (firstOperand == null) {
//       firstOperand = number;
//       return;
//     }
//     if (operator == null) {
//       firstOperand = '$firstOperand$number';
//       return;
//     }
//     if (secondOperand == null) {
//       secondOperand = number;
//       return;
//     }

//     secondOperand = '$secondOperand$number';

//     notifyListeners();
//   }


//   onOpratorPressed(String operator){
//      firstOperand ??= 0;
//     this.operator = operator;

//   }

//   calculateResult(){
//      if (operator == null || secondOperand == null) {
//     return;
//   }
//      switch (operator) {
//       case '+':
//         result = firstOperand + secondOperand;
//         break;
//       case '-':
//         result = firstOperand - secondOperand;
//         break;
//       case '*':
//         result = firstOperand * secondOperand;
//         break;
//       case '/':
//         if (secondOperand == 0) {
//           return;
//         }
//         result = firstOperand ~/ secondOperand;
//         break;
//     }

//     firstOperand = result;
//     operator = null;
//     secondOperand = null;
//     result = null;

//   }
// }
