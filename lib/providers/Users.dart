import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.model.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    final id = Random().nextDouble().toString();

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
          user.id,
          (value) => User(
                id: user.id,
                nome: user.nome,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    } else {
      // adicionar
      _items.putIfAbsent(
          id,
          () => User(
              id: id,
              nome: user.nome,
              email: user.email,
              avatarUrl: user.avatarUrl));
    }
    notifyListeners();
  }

  void remover(User user){
    if(user !=null && user.id != null){
      _items.remove(user.id);
    }
    notifyListeners();
  }
}
