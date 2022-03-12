import 'package:flutter/material.dart';

class UserLoginWidget extends StatelessWidget {
  const UserLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _UserNameInput(),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            _PasswordInput(),
          ],
        ),
      ),
    );
  }
}

class _UserNameInput extends StatelessWidget {
  const _UserNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      cursorColor: Colors.amber,
      decoration: InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        labelText: 'UserName',
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      obscureText: true,
      cursorColor: Colors.amber,
      decoration: InputDecoration(
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
