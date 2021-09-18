import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          color: Colors.transparent,
          child: Column(
            children: [
              TextFormField(
                // autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nombre de la  persona',
                  labelText: 'Name',
                ),
                onChanged: (text) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}