import 'package:flutter/material.dart';

import '../constants.dart';

class LoginLogo extends StatelessWidget {
  final String image;
  final String name;

  const LoginLogo({@required this.image, @required this.name});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: defaultPadding,
            ),
            Image.asset(
              image,
              width: 120,
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
