import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/navigation/get_rout_name.dart';
import 'package:trip/screen/home/view/home_main.dart';
import 'package:trip/screen/login/controller/authenication.dart';
import 'package:trip/screen/login/view/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDsjDoEs_6JPqz61wWOZIlo-LnhtvnUxaI",
          appId: "1:999377347868:android:698e4c36432fa572c486d9",
          messagingSenderId: "999377347868",
          projectId: "tripapp-23819"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: AuthenicationBindings(),
      getPages: GetRout().route,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return const LoginPage();
            }
          }
          return const MainScreen();
        },
      ),
    );
  }
}
