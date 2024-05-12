
import 'package:advanced_flutter/features/provider/counter.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewProvider extends StatelessWidget {
  HomeViewProvider({super.key});

  final GlobalKey<ScaffoldState> keyState=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:keyState,
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children:[
          FloatingActionButton(
            onPressed:(){
              keyState.currentContext?.read<CounterProvider>().increment();

            }
          ),
          Text(context.watch<CounterProvider>().number,)
        ]
      ),
    );
  }
}
