import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;

  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int i) {
    this._selectedMenuOpt = i;
    // Cuando se cambie el valor de i, notificara a todos los widgets que esten escuchando este cambio
    notifyListeners();
  }
}