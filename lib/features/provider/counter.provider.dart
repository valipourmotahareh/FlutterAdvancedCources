import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier{
   int _number =0;
   String get number => _number.toString();

   increment(){
     _number++;
     notifyListeners();
   }
}