import 'package:fisioterapia/screens/screens.dart';
import 'package:fisioterapia/widgets/widgets.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getAplicationRoutes() {
  
  return <String, WidgetBuilder> {
    
    'card_fisioterapueta'                : (_) => CardFisioterapeuta(),
    'perfil_screen'                      : (_) => PerfilScreen(),
      
    'list_videos_screen1'                : (_) => ListVideosScreen1(),
    'list_videos_screen2'                : (_) => ListVideosScreen2(),
    'list_videos_screen3'                : (_) => ListVideosScreen3(),
    'nivel_ejercicios_screen'            : (_) => NivelEjercicios(),
    'utilidades_sentados_screen'         : (_) => UtilidadesSentadoScreen(),
    'utilidades_echados_screen'          : (_) => UtilidadesEchadoScreen(),
    'utilidades_parado_screen'           : (_) => UtilidadesParadoScreen(),
    'medir_saturacion_freceuncia'        : (_) => MedirSaturacionFrecuenciaScreen(),
    'saturacion_frecuencia_antes'        : (_) => SaturacionFrecuenciaAntes(),
    'saturacion_frecuencia_despues'      : (_) => SaturacionFrecuenciaDespues(),
    'historial_frecuencia_saturacion'   : (_) => HistorialFrecuenciaSaturacion(),
      
    'login_screen'                       : (_) => LoginScreen(),
    'menu_principal_screen'              : (_) => MenuPrincipalScreen(),
      
    'nav_drawer'                         : (_) => NavDrawer(),
      
    'checking'                           : (_) => CheckAuthScreen(),
      
    // 'home'                            : (_) => HomeScreen(),
      
    'register'                           : (_) => RegisterScreen(),

    'consideracion_ejercicios_screen'    : (_) => ConsideracionesEjercicios(),
    'recomendaciones_ejercicios_screen'  : (_) => RecomendacionEjercicios(),
    
    
    'guia_pulsimetro_screen'             : (_) => GuiaPulsimetro(),
    'guia_app_screen'                    : (_) => GuiaApp(),
    'escala_borg_1'                     : (_) => EscalaBorg1(),
    'escala_borg_2'                     : (_) => EscalaBorg2(),
    'escala_borg_3'                     : (_) => EscalaBorg3(),







  };
}

        
