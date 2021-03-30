import 'package:flutter/material.dart';
import 'package:flutter_crud/providers/Users.dart';
import 'package:flutter_crud/widgets/user_tile.dart';
import 'package:provider/provider.dart';

class UsersList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Users users = Provider.of(context);

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
        itemCount: users.count,
        itemBuilder: (context, index) =>
            UserTile(users.byIndex(index)),
      ),
    );
  }

}
