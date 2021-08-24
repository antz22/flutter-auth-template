import 'package:flutter/material.dart';
import 'package:project_name/constants/constants.dart';
import 'package:project_name/screens/login/login_screen.dart';
import 'package:project_name/screens/sign_up/sign_up_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 0.125 * MediaQuery.of(context).size.height),
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
                horizontal: 2 * kDefaultPadding, vertical: 4 * kDefaultPadding),
            decoration: BoxDecoration(),
            child: Column(
              children: [
                Text('Title text 1.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0,
                    )),
                SizedBox(height: kDefaultPadding),
                Text(
                  'Description text.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.8,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF9A9A9A),
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(48.0),
              ),
              width: MediaQuery.of(context).size.width - 5 * kDefaultPadding,
              height: 52.0,
              child: Center(
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 1.5 * kDefaultPadding),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            ),
            child: Text(
              'Log In',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
