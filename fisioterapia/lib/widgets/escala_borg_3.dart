import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisioterapia/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EscalaBorg3 extends StatefulWidget {

  @override
  State<EscalaBorg3> createState() => _EscalaBorg3State();
}

class _EscalaBorg3State extends State<EscalaBorg3> {
  

     

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
                    NivelEsfuerzo3(numNivel: '0', textNivel: 'Normal', colorNivel: Colors.blue,),
                    NivelEsfuerzo3(numNivel: '1', textNivel: 'Bien', colorNivel: Colors.blue,),
                    NivelEsfuerzo3(numNivel: '2', textNivel: 'Muy Bien', colorNivel: Colors.blue,),
                    NivelEsfuerzo3(numNivel: '3', textNivel: 'Excelente', colorNivel: Colors.blue,),
                    NivelEsfuerzo3(numNivel: '4', textNivel: 'Algo pesado', colorNivel: Colors.green,),
                    NivelEsfuerzo3(numNivel: '5', textNivel: 'Pesado', colorNivel: Colors.amber,),
                    NivelEsfuerzo3(numNivel: '6', textNivel: 'Más pesado', colorNivel: Colors.amber,),
                    NivelEsfuerzo3(numNivel: '7', textNivel: 'Muy pesado', colorNivel: Colors.orange,),
                    NivelEsfuerzo3(numNivel: '8', textNivel: 'Muy muy pesado', colorNivel: Colors.orange,),
                    NivelEsfuerzo3(numNivel: '9', textNivel: 'Máximo', colorNivel: Colors.red,),
                    NivelEsfuerzo3(numNivel: '10', textNivel: 'Extremo', colorNivel: Colors.red,),
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

class NivelEsfuerzo3 extends StatefulWidget {
  
  final String numNivel;
  final String textNivel;
  final Color colorNivel;
  const NivelEsfuerzo3({
    Key? key, required this.numNivel, required this.textNivel, required this.colorNivel,
  }) : super(key: key);

  @override
  State<NivelEsfuerzo3> createState() => _NivelEsfuerzo3State();
}

class _NivelEsfuerzo3State extends State<NivelEsfuerzo3> {

  BorderRadius _border = BorderRadius.circular(8);

  final firebase = FirebaseFirestore.instance;
  Future<User?>obteniendoUsers(BuildContext _, AsyncSnapshot<User?> snapshot) async{
    try {
      if(snapshot.hasData) {
        final usuario = snapshot.data;
        print(usuario?.displayName);
        await firebase
        .collection("Usuario")
        .doc(usuario?.email)
        .update({
          "Nivel Esfuerzo 3" : third_nivel_esfuerzo,

        });
      }
    }catch(e) {
      print(e);
    }
  }
   
  var third_nivel_esfuerzo = ""; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 5, right: 30),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              this.widget.numNivel,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: this.widget.colorNivel,
              ),
            )
          ),
          // const SizedBox(width: 100,),
          Expanded(
            flex: 4,
            child: FutureBuilder<User?>(
            future: Auth.instance.user,
            builder:(BuildContext _ ,AsyncSnapshot <User?> snapshot){
              if(snapshot.hasData){
                final user = snapshot.data;
                print(user?.displayName);
                return InkWell(
                  onTap: () {
                    if(this.widget.textNivel != null) {
                      third_nivel_esfuerzo = this.widget.textNivel;
                      print(third_nivel_esfuerzo); 
                      obteniendoUsers(_, snapshot);
                    }
                    setState(() {
                      if(_border == BorderRadius.circular(8)) {
                        _border = BorderRadius.circular(20);

                      }else {
                        _border = BorderRadius.circular(8);

                      }

                    });
                    
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: this.widget.colorNivel,
                      borderRadius: _border,
                    ),
                    child: Text(
                      this.widget.textNivel,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }else if(snapshot.hasError){
                return Center(
                  child: Text('Network error'),
                );
              }
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }),
          )
        ],
      ),
    );
  }
}


