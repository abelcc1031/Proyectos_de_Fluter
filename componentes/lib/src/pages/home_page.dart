import 'package:componentes/src/pages/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/navigator.dart';
// import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componenetes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    // print(menuProvider.opciones);
    // menuProvider.cargarData().then((opciones) {
    //   print('Lista');
    //   print(opciones);
    // });

    return FutureBuilder(
      future: menuProvider.cargarData(), //Esta enlazada a lo que queremos esperar
      initialData: [], //La información que va a tener por defecto, mientras no sea resuelto ese future
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },

    );

    // return ListView(
    //   children: _listaItems(),
    // );
  }

  List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];

    data?.forEach((opt) {
      
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: () {

          // final route = MaterialPageRoute(
          //   builder: (context) {
          //     return AlertPage();
          //   }
          // );

          // Navigator.push(context, route);

          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)
              ..add(Divider());
    });

    return opciones;
  }
}