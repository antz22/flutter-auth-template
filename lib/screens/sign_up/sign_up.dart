import 'package:project_name/screens/login/login.dart';
import 'package:project_name/widgets/custom_snackbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:project_name/constants/constants.dart';
import 'package:project_name/services/authentication.dart';
import 'package:project_name/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  _register() async {
    if (passwordController.text == password2Controller.text) {
      Map data = await context
          .read<AuthenticationService>()
          .registerUser(usernameController.text, passwordController.text);
      if (data.containsKey('statusCode') &&
          data['statusCode'] != '200' &&
          data['statusCode'] != '201') {
        String key = data['body'].keys.elementAt(0);
        CustomSnackbar.buildWarningMessage(
            context, 'Error', data['body'][key][0]!);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(isFirstTime: true),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 0.1 * MediaQuery.of(context).size.height),
          Image(image: AssetImage('assets/images/logo.png')),
          SizedBox(height: 0.1 * kDefaultPadding),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Logo',
              style: TextStyle(
                  fontSize: 42.0,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor),
              children: const <TextSpan>[
                TextSpan(
                  text: 'Text',
                  style: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: 2 * kDefaultPadding, vertical: 3 * kDefaultPadding),
            decoration: BoxDecoration(),
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'Username',
                  controller: usernameController,
                ),
                SizedBox(height: kDefaultPadding),
                CustomTextField(
                  hintText: 'Password',
                  controller: passwordController,
                ),
                SizedBox(height: kDefaultPadding),
                CustomTextField(
                  hintText: 'Repeat Password',
                  controller: password2Controller,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _register(),
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(13.0),
              ),
              width: MediaQuery.of(context).size.width - 4 * kDefaultPadding,
              height: 52.0,
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
