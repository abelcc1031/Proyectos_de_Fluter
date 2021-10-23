import 'package:flutter/material.dart';


class EscalaBorg2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SafeArea(
                child: Row(
                  children: [
                    Container(
                      // alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                      // width: double.infinity,
                      // color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white, size: 20,),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          const Text(
                            '¿Cómo se siente el esfuerzo?', 
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),
            Expanded(
              flex: 5,
              child: Container(
                // color: Colors.yellow,
                child: ListView(
                  children: const[
                    NivelEsfuerzo2(numNivel: '0', textNivel: 'Normal', colorNivel: Colors.blue,),
                    NivelEsfuerzo2(numNivel: '1', textNivel: 'Bien', colorNivel: Colors.blue,),
                    NivelEsfuerzo2(numNivel: '2', textNivel: 'Muy Bien', colorNivel: Colors.blue,),
                    NivelEsfuerzo2(numNivel: '3', textNivel: 'Excelente', colorNivel: Colors.blue,),
                    NivelEsfuerzo2(numNivel: '4', textNivel: 'Algo pesado', colorNivel: Colors.green,),
                    NivelEsfuerzo2(numNivel: '5', textNivel: 'Pesado', colorNivel: Colors.amber,),
                    NivelEsfuerzo2(numNivel: '6', textNivel: 'Más pesado', colorNivel: Colors.amber,),
                    NivelEsfuerzo2(numNivel: '7', textNivel: 'Muy pesado', colorNivel: Colors.orange,),
                    NivelEsfuerzo2(numNivel: '8', textNivel: 'Muy muy pesado', colorNivel: Colors.orange,),
                    NivelEsfuerzo2(numNivel: '9', textNivel: 'Máximo', colorNivel: Colors.red,),
                    NivelEsfuerzo2(numNivel: '10', textNivel: 'Extremo', colorNivel: Colors.red,),
                    SizedBox(height: 20,),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
   );
  }
}

class NivelEsfuerzo2 extends StatelessWidget {
  
  final String numNivel;
  final String textNivel;
  final Color colorNivel;
  const NivelEsfuerzo2({
    Key? key, required this.numNivel, required this.textNivel, required this.colorNivel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 5, right: 30),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              this.numNivel,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: this.colorNivel,
              ),
            )
          ),
          // const SizedBox(width: 100,),
          Expanded(
            flex: 4,
            child: InkWell(
              onTap: () {
                debugPrint('1');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: this.colorNivel,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  this.textNivel,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}