import 'package:flutter/material.dart';

import '../constants.dart';

class CustomRaisedButtonn extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomRaisedButtonn({
    @required this.text,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      child: RaisedButton(
        elevation: 2,
        highlightElevation: 5,
        shape: StadiumBorder(),
        color: Theme.of(context).primaryColor,
        onPressed: this.onPressed,
        child: Container(
          height: 54,
          width: double.infinity,
          child: Center(
            child: Text(
              this.text,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
