import 'package:flutter/material.dart';
import 'package:fisioterapia/services/services.dart';

import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthServices>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        leading: IconButton(
          icon: Icon(Icons.login_outlined),
          onPressed: () {
            authService.logout();
            Navigator.pushReplacementNamed(context, 'login_screen');
          },
        ),
      ),
      body: Center(
        child: Text('HomeScreen'),
     ),
   );
  }
}