import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/theme.dart';

import 'helper/url_strategy_native.dart'
if(dart.library.html) 'helper/url_strategy_web.dart';
import 'app/routes/app_pages.dart';

void  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // ignore: prefer_const_constructors
      options: FirebaseOptions(
          apiKey: "AIzaSyBSAzetUkMFCnVVGFlXJiL9-gGvcZHoow4",
          appId: "1:433154276012:web:f2183165c11530e0683d09",
          messagingSenderId: "433154276012",
          projectId: "sspi-fahim",
        storageBucket: "sspi-fahim.appspot.com"

      ));
  runApp(const MyApp());
  isWebConfig();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,

    );
  }
}