import 'package:flutter/material.dart';
import 'package:chat_app_client/routes/routes.dart';

import '../constants.dart';

class LoginLabels extends StatelessWidget {
  final String route;

  const LoginLabels({@required this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.route == RoutePath.loginRoute
                ? 'Have an account?'
                : 'New here?',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: defaultPadding / 4,
          ),
          GestureDetector(
            child: Text(
              this.route == RoutePath.loginRoute
                  ? 'Sign In'
                  : 'Create an Account',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.route);
            },
          ),
        ],
      ),
    );
  }
}
