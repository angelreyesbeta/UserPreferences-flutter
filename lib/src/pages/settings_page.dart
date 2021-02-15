import 'package:flutter/material.dart';



import 'package:preferencias/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias/src/widgets/menu_widgets.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName='setting';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState(){
    super.initState();

    prefs.ultimaPagina=SettingsPage.routeName;

    //_cargarPref();
    _genero=prefs.genero;
    _colorSecundario=prefs.colorSecundario;

    _textController=new TextEditingController(text:prefs.nombreUsuario);

  }

 /*  _cargarPref()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genero=prefs.getInt('genero');
    setState(() {
      
    });

  } */

   _setSelectedRadio(int valor){

   /*  SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('genero', valor); */
    prefs.genero=valor;
    _genero=valor;
    setState(() {
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias Settings'),
        backgroundColor: (prefs.colorSecundario)?Colors.teal:Colors.blue,
      ),
      drawer: MenuWidgest(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),),

          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color Secundario'),
            onChanged: (value){    
              setState(() {
                _colorSecundario=value;
                prefs.colorSecundario=value;           
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
           RadioListTile(
            value: 3,
            title: Text('Otro'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child:TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono'
              ),
              onChanged: (value){
                prefs.nombreUsuario=value;
              },
            ),
          )


        ],
      )
    );
  }
}