import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.model.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    return ListTile(
      leading: avatar,
      title: Text(user.nome),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
              onPressed: null,
            ),
            IconButton(
              icon: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }
}
