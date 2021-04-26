import 'package:bmi_calculator/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './iput_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark().copyWith(
      primaryColor: Color(0xFF0A0E21),
      scaffoldBackgroundColor:Color(0xFF0A0E21),
     // accentColor: Colors.red,
  ) ,
      home: 
      ChangeNotifierProvider(create: (context)=>Statelift(),
      child:InputPage(),
      )
      
    );
  }
}

