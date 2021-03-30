import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';

class UsersList extends StatelessWidget {

  final users = { ...DUMMY_USERS };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listagem de usuários")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => Text(users.values.elementAt(index).nome),
      ),
    );
  }
}
