import 'package:ditonton_modular/firebase_options.dart';
import 'package:ditonton_modular/launcher/app.dart';
import 'package:ditonton_modular/launcher/injection.dart' as di;
import 'package:shared_modul/shared_modul.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init(baseUrl);
  await DatabaseHelper().initDb();
  try {
    runApp(const MyApp());
  } catch (e) {
    debugPrint("Error: $e");
  }
}