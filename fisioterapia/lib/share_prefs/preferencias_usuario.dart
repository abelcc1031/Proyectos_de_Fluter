import 'package:shared_preferences/shared_preferences.dart';


class PreferenciasUsuario {


  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }
  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }


  /*
  // GET y SET del Género
  int get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }
  
  // GET y SET del Color Secundario

  bool get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }


  // GET y SET del nombreUsuario

  String get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  */
  
  // GET y SET de la Ultima pagina

  String get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'checking';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }



  // GET y SET del Saturacion Antes
  int get saturacion_antes {
    return _prefs.getInt('saturacion_antes') ?? 0;
  }

  set saturacion_antes(int value) {
    _prefs.setInt('saturacion_antes', value);
  }
  
  // GET y SET del Saturacion Despues
  int get saturacion_despues {
    return _prefs.getInt('saturacion_despues') ?? 0;
  }

  set saturacion_despues(int value) {
    _prefs.setInt('saturacion_despues', value);
  }

  // GET y SET del Frecuencia Antes
  int get frecuencia_antes {
    return _prefs.getInt('frecuencia_antes') ?? 0;
  }

  set frecuencia_antes(int value) {
    _prefs.setInt('frecuencia_antes', value);
  }

  // GET y SET del Frecuencia Despues
  int get frecuencia_despues {
    return _prefs.getInt('frecuencia_despues') ?? 0;
  }

  set frecuencia_despues(int value) {
    _prefs.setInt('frecuencia_despues', value);
  }


  // Acitvar borde de Escala de Borg 
  // GET y SET de Border1
  bool get border1 {
    return _prefs.getBool('border1') ?? false;
  }

  set border1(bool value) {
    _prefs.setBool('border1', value);
  }
  // GET y SET de Border2
  bool get border2 {
    return _prefs.getBool('border2') ?? false;
  }

  set border2(bool value) {
    _prefs.setBool('border2', value);
  }
  // GET y SET de Border3
  bool get border3 {
    return _prefs.getBool('border3') ?? false;
  }

  set border3(bool value) {
    _prefs.setBool('border3', value);
  }





  

}