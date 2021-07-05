import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:chat_app_client/models/user.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final users = [
    User(uid: '1', name: 'Mafe', email: 'mafe@m.com', online: true),
    User(uid: '2', name: 'Dani', email: 'dani@m.com', online: false),
    User(uid: '3', name: 'Mono', email: 'mono@m.com', online: false),
    User(uid: '4', name: 'Cami', email: 'cami@m.com', online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mafe'),
        centerTitle: true,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.circle,
              color: Colors.green, // I'm online
            ),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon(
            Icons.check,
            color: Colors.amber,
          ),
        ),
        onRefresh: _loadUsers,
        child: _listViewUsers(),
      ),
    );
  }

  ListView _listViewUsers() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _userListTile(users[i]),
      separatorBuilder: (_, i) => Divider(height: 0.0, thickness: 1.0),
      itemCount: users.length,
    );
  }

  ListTile _userListTile(User user) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(user.name.substring(0, 1)),
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Icon(
        Icons.circle,
        color: user.online ? Colors.green : Colors.red,
      ),
    );
  }

  _loadUsers() async {
    print("Executing");
    await Future.delayed(Duration(seconds: 1));
    _refreshController.refreshCompleted();
  }
}
