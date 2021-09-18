import 'package:flutter/material.dart';


class BasicDesignScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Imagen
          Image(image: AssetImage('assets/landscape.jpg'),),

          // Titulo
          Title(),

          // ButtonSection
          ButtonSection(),

          // Descripcion
          Description()
        ],
      ),
   );
  }
}



class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Deschinen Lake Campground', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.black45),),
            ],
          ),
          Expanded(child: Container(),),
          Icon(Icons.star, color: Colors.red,),
          Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButtom(icon: Icons.call, text: 'CALL'),
          CustomButtom(icon: Icons.map_sharp, text: 'ROUTE'),
          CustomButtom(icon: Icons.share, text: 'SHARE'),


        ],
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {

  final IconData icon;
  final String text;
  const CustomButtom({
    Key? key, required this.icon, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(this.icon, color: Colors.blue, size: 30,),
        Text(this.text, style: TextStyle(color: Colors.blue),),
      ],
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text('Sunt in exercitation mollit sint ipsum adipisicing. Lorem consectetur amet ut excepteur eiusmod ipsum duis. Amet officia cupidatat ea velit laborum ut. exercitation mollit sint ipsum adipisicing. Lorem consectetur amet ut excepteur eiusmod ipsum duis. Amet officia cupidatat ea velit laborum ut', textAlign: TextAlign.justify,),
    );
  }
}










