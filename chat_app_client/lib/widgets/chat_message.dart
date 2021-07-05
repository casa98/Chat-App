import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String uid; // It will help me what position to show messages in
  final AnimationController animationController;

  const ChatMessage({
    @required this.text,
    @required this.uid,
    @required this.animationController,
  });
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeIn,
        ),
        child: Container(
          child: this.uid == 'my_uid'
              ? _myMessage(_screenWidth)
              : _notMyMessage(_screenWidth),
        ),
      ),
    );
  }

  Widget _myMessage(double width) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(
          left: width * 0.2,
          right: 5.0,
          bottom: 5.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.blueGrey,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Text(
          this.text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _notMyMessage(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: 5.0,
          right: width * 0.2,
          bottom: 5.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFFE4E5E8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Text(
          this.text,
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
