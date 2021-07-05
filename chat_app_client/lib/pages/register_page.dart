import 'package:flutter/material.dart';
import 'package:chat_app_client/routes/routes.dart';
import 'package:chat_app_client/widgets/custom_raised_button.dart';
import 'package:chat_app_client/widgets/custom_input.dart';
import 'package:chat_app_client/widgets/login_labels.dart';
import 'package:chat_app_client/widgets/login_logo.dart';

import '../constants.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: authBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LoginLogo(
                  image: 'assets/images/tgx.png',
                  name: 'TMessenger Sign Up',
                ),
                _Form(),
                LoginLabels(route: RoutePath.loginRoute),
                Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Name',
            keyboardType: TextInputType.text,
            textEditingController: nameController,
          ),
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textEditingController: emailController,
          ),
          CustomInput(
            icon: Icons.lock_outlined,
            placeholder: 'Password',
            textEditingController: passwordController,
            isPassword: true,
          ),
          CustomRaisedButtonn(
            text: 'Sign Up',
            onPressed: () {
              print(nameController.text);
              print(emailController.text);
              print(passwordController.text);
            },
          ),
        ],
      ),
    );
  }
}
