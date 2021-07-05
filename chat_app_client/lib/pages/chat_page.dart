import 'package:flutter/material.dart';
import 'package:chat_app_client/widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Benito Cámela'),
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (_, i) {
                  return _messages[_messages.length - (i + 1)];
                },
              ),
            ),
            Divider(height: 1.0, thickness: 1.0),
            Container(
              child: textInputField(),
            ),
          ],
        ),
      ),
    );
  }

  SafeArea textInputField() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (value) {},
                decoration: InputDecoration.collapsed(hintText: 'Send Message'),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 2.0),
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: Icon(Icons.send_rounded),
                onPressed: () => _handleSubmit(_textController.text.trim()),
              ),
            )
          ],
        ),
      ),
    );
  }

  _handleSubmit(String text) {
    if (text.length > 0) {
      final newMessage = new ChatMessage(
        text: text,
        uid: 'my_uid',
        animationController: AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 150),
        ),
      );
      _messages.add(newMessage);
      newMessage.animationController.forward();
      _textController.clear();
      _focusNode.requestFocus();
      setState(() {});
    }
  }

  @override
  void dispose() {
    // Clean all created animation controllers
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
