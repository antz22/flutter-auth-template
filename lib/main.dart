import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_name/screens/producer/home/producer_home.dart';
import 'package:project_name/screens/sign_up/ask_location_permission_screen.dart';
import 'package:project_name/services/authentication.dart';
import 'package:project_name/services/APIServices.dart';
import 'package:project_name/services/cart.dart';
import 'package:project_name/services/user_data.dart';

import 'screens/home/home.dart';
import 'screens/landing_page/landing_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationService()),
        Provider(create: (context) => APIServices()),
      ],
      child: MaterialApp(
        title: 'Example Title',
        debugShowCheckedModeBanner: false,
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  Future<bool> _retrieveToken() async {
    final storage = new FlutterSecureStorage();
    String? token = await storage.read(key: 'restAPI');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _retrieveToken(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return snapshot.data! ? HomeScreen() : LandingPage();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
