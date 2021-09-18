import 'package:flutter/material.dart';


class ScrollScreen extends StatelessWidget {

  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [
        0.5,
        0.5,
      ],
      colors: [
        Color(0xff86FFD9),
        Color(0xff4EC3DB),
      ],
    )
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: boxDecoration,
        child: PageView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: [
            Page1(),
            Page2(),
          ],
        ),
      )
    );
  }
}

class Page1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background
        Background(),

        // MainContent
        MainContent()
      ],
    );
  }
}



class Background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff4EC3DB),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
      )
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white);
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          Text('11°', style: textStyle,),
          Text('Miércoles', style: textStyle,),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 100,),
        ],
      ),
    );
  }
}


class Page2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff4EC3DB),
      child: Center(
        child: TextButton(
          onPressed: () { Navigator.pushNamed(context, 'home_screen'); },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Bienvenido', style: TextStyle(color: Colors.white, fontSize: 30),),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff0098FA),
            shape: StadiumBorder(),
          ),
        ),
      ),
    );
  }
}















