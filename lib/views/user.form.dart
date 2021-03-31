import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.model.dart';
import 'package:flutter_crud/providers/Users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de cadastro"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();
              }

              Provider.of<Users>(context, listen: false).put(
                User(
                  id: _formData['id'],
                  nome: _formData['nome'],
                  email: _formData['email'],
                  avatarUrl: _formData['avatarUrl'],
                ),
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome",
                ),
                validator: (value) {
                  if (value.isEmpty || value.trim().isEmpty) {
                    return "Campo não pode ser vazio";
                  }
                  if (value.length < 3) {
                    return "Nome precisa ter mais que três caracteres";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                onSaved: (value) => _formData['nome'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "E-mail",
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "URL do Avatar",
                ),
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
