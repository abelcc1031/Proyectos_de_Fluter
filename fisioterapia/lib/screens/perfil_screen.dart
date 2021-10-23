
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisioterapia/services/auth.dart';
import 'package:fisioterapia/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fisioterapia/theme/colors.dart' as color;

class PerfilScreen extends StatefulWidget {
  PerfilScreen({Key? key}) : super(key: key);

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withOpacity(0.93),
        child: SafeArea(
          child: FutureBuilder<User?>(
            future: Auth.instance.user,
            builder:(BuildContext _ ,AsyncSnapshot <User?> snapshot){
              if(snapshot.hasData){
                final user = snapshot.data;
                return ListView(
                  children:<Widget> [
                    SizedBox(height: 10,),
                    Container(
                      // color: Colors.green,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: InkWell(
                        onTap: () {
                          Auth.instance.logOut(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: color.AppColor.gradientFirst.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(Icons.exit_to_app, color: Colors.white, size: 20,),
                        )
                      )
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.lightBlue[600],
                      radius: 65,
                      child: user?.photoURL != null
                      ?ClipOval(
                        child: Image.network(user?.photoURL ?? "No user Photo",
                          width: 120, 
                          height: 120,
                          fit: BoxFit.contain
                        ),
                      )
                      : _getAlias(user?.displayName ?? "No user Leter"),
                    ),

                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        padding: EdgeInsets.symmetric( vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[600],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(2, 6), // changes position of shadow
                            ),
                          ],
                        ),
                      
                        child: Column(

                          children: [
                            Column(
                              children: [
                                Text('Nombre: ', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.indigo[600], fontSize: 20),),
                                SizedBox(height: 10,),
                                Text(
                                  user?.displayName ?? "No user Name Provider",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white, 
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                
                              ],
                            ),
                            SizedBox(height: 20,),
                            Column(
                              children: [
                                Text('Email: ', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.indigo[600], fontSize: 20),),
                                SizedBox(height: 10,),
                                Text(
                                  user?.email ?? "No user Email",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18, 
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),

                            

                          ],
                        ),
                      ),
                    ),
                    
                  ],
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
        ),
      ),
    );
  }

  Widget _getAlias(String displayName) {
    final List<String>? tmp = displayName.split(" ");
    String alias = "";
    if(tmp!.length>0){
      alias = tmp[0][0];
      if(tmp.length == 3){
        alias += tmp[1][0];
      }
    }
    
    return Center(
      child: Text(
        alias,
        style: TextStyle(fontSize: 30),
      )
    );
  }
}
