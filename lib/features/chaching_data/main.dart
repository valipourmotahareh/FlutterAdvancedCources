import 'package:advanced_flutter/features/chaching_data/app.dart';
import 'package:advanced_flutter/features/chaching_data/core/dependency_injection/di.dart';
import 'package:flutter/cupertino.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupDi();
  runApp(const App());
}