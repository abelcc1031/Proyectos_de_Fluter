
import 'package:fisioterapia/theme/theme.dart';
import 'package:fisioterapia/widgets/widgets.dart';

import 'package:flutter/material.dart';


class MenuPrincipalScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: DeliveryColors.background,
        // leading: IconButton(
        //   tooltip: 'Abrir el menú de navegación',
        //   onPressed: () {
        //     Navigator.pushNamed(context, 'nav_drawer');
        //   }, 
        //   icon: Icon(Icons.menu),
        // ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Text('Hola Abel',),
            ),
          ],
        ),
      ),


      body: Stack(
        children: [

          // Background
          BackgroundImage(), 

          // Home Body
          _HomeBody(),
        ],
      ),
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [


          // Card Table
          CardTable(),

        ],
      ),
    );
  }
}