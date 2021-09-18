// Para leer los archivos json necesitamos importar el siguiente paquete
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


class _MenuProvider {
  List<dynamic> opciones = [];


  // Future biulder se contruye cuando todo un proceso culmine
  _MenuProvider(){ // Constructor
    // cargarData();
  }


  Future<List<dynamic>> cargarData() async {//Tenemos un future que resuelve una lista con objetos dinamicos
    // Todo esto regresa un future
    final resp = await rootBundle.loadString('data/menu_opts.json');
     
      Map dataMap = json.decode(resp);
      print(dataMap);
      opciones = dataMap['rutas'];

      return opciones;
      
  }
}

final menuProvider = new _MenuProvider();