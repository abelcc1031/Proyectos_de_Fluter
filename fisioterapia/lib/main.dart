import 'package:fisioterapia/providers/ui_provider.dart';
import 'package:fisioterapia/screens/screens.dart';
import 'package:fisioterapia/services/services.dart';
import 'package:fisioterapia/share_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';

import 'package:fisioterapia/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ChangeNotifierProvider(create: ( _ ) => AuthServices(),),

        
      ],

      child: MaterialApp(
    
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'checking',
        routes: getAplicationRoutes(),
        scaffoldMessengerKey: NotificationsService.messengerKey,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300]
        ),
      ),
    );
  }
}