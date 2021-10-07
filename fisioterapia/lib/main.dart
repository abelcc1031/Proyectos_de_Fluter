import 'package:fisioterapia/providers/ui_provider.dart';
import 'package:fisioterapia/share_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';

import 'package:fisioterapia/routes/routes.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {

    return MultiProvider( 
      // El provider nos servira para decirle a nuestra aplicacion: busca en tu árbol de widgets, la clase UiProvider
      providers: [
        // La instruccion que se va a ejecutar cuando no hay ninguna instancia del provider creado
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        
      ],

      child: MaterialApp(
    
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: prefs.ultimaPagina,
        routes: getAplicationRoutes(),
      ),
    );
  }
}