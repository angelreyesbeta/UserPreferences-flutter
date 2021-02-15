import 'package:flutter/material.dart';
import 'package:preferencias/src/share_prefs/preferencias_usuario.dart';

import 'package:preferencias/src/widgets/menu_widgets.dart';

class HomePage extends StatelessWidget {

  static final String routeName='home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {


    prefs.ultimaPagina=HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuarios Home Page'),
        backgroundColor: (prefs.colorSecundario)?Colors.teal:Colors.blue,
      ),
      drawer:MenuWidgest(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text('Color Secundario: ${prefs.colorSecundario}'),
        Divider(),
        Text('Genero: ${ prefs.genero }'),
        Divider(),
        Text('Nombre secundario: ${prefs.nombreUsuario}'),
        Divider(),
      ],),
    );
  }


 

}