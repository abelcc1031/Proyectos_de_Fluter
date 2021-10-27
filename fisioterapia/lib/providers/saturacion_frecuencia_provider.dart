import 'package:flutter/material.dart';

class SaturacionFrecuenciaProvider extends ChangeNotifier {
  
  int _saturacion_antes = 0;
  int _saturacion_despues = 0;
  int _frecuencia_antes = 0;
  int _frecuencia_despues = 0;


  // Saturación

  int get saturacion_antes {
    return _saturacion_antes;
  }

  set saturacion_antes(int i) {
    this._saturacion_antes = i;
    // Cuando se cambie el valor de i, notificara a todos los widgets que esten escuchando este cambio
    notifyListeners();
  }


  int get saturacion_despues {
    return _saturacion_despues;
  }

  set saturacion_despues(int i) {
    this._saturacion_despues = i;
    // Cuando se cambie el valor de i, notificara a todos los widgets que esten escuchando este cambio
    notifyListeners();
  }


  // Frecuencia cardiaca
  int get frecuencia_antes {
    return _frecuencia_antes;
  }

  set frecuencia_antes(int i) {
    this._frecuencia_antes = i;
    // Cuando se cambie el valor de i, notificara a todos los widgets que esten escuchando este cambio
    notifyListeners();
  }



  int get frecuencia_despues {
    return _frecuencia_despues;
  }

  set frecuencia_despues(int i) {
    this._frecuencia_despues = i;
    // Cuando se cambie el valor de i, notificara a todos los widgets que esten escuchando este cambio
    notifyListeners();
  }
}
