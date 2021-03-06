import 'package:flutter/material.dart';
import 'package:chat_app_client/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      initialRoute: RoutePath.chatRoute,
      routes: appRoutes,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}
