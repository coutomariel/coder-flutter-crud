import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/widgets/user_tile.dart';

class UsersList extends StatelessWidget {
  final users = {...DUMMY_USERS};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lista de usuários")),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) =>
            UserTile(users.values.elementAt(index)),
      ),
    );
  }
}
