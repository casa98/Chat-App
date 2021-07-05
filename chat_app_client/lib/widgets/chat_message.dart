import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String uid; // It will help me what position to show messages in

  const ChatMessage({Key key, this.text, this.uid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: this.uid == 'my_uid'
          ? _myMessage(_screenWidth)
          : _notMyMessage(_screenWidth),
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
