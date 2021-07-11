import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:imei_plugin/imei_plugin.dart';

import '../main.dart';
import 'loginPage.dart';
import 'package:appnode/controllers/notificaciones.dart';
notificaciones notificacion = notificaciones();

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _platformImei = 'Unknown';
  String uniqueId = "Unknown";
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.teal],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            headerSection(),
            textSection(),
            buttonSection(),
          ],
        ),
      ),
    );
  }
  Future<void> initPlatformState() async {
    String platformImei;
    String idunique;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformImei =
          await ImeiPlugin.getImei(shouldShowRequestPermissionRationale: false);
      List<String> multiImei = await ImeiPlugin.getImeiMulti();
      //print(multiImei);
      idunique = await ImeiPlugin.getId();
    } on PlatformException {
      platformImei = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformImei = platformImei;
      uniqueId = idunique;
    });
  }

  signUp(String username, email, pass, name, lastname, place,yrs,imei) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      
      'username': username,
      'email': email,
      'password': pass,
      'nme': name,
      'lastname': lastname,
      'place': place,
      'years': yrs,
      'imei':imei,
      
    };
    print(data);
    var jsonResponse = null;

    var response = await http.post(Uri.parse('http://192.168.56.1:3000/signup'), body: data);
    //var response = await http.post(Uri.parse('https://noti-91d20-default-rtdb.firebaseio.com/firebase/signup.json'),body:data);
    if(response.statusCode == 404) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    else {
      setState(() {
        _isLoading = false;
      });
      _showAlertDialog(email, username);
      print(response.body);
    }
  }

  Container buttonSection() {
    
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        onPressed: emailController.text == "" || passwordController.text == "" || userController.text == "" || nmeController.text == "" || lastController.text == "" || placeController.text == "" || yearController.text == "" ? null : () {
          setState(() {
            _isLoading = true;
          });
          
          signUp(userController.text,emailController.text, passwordController.text, nmeController.text, lastController.text, placeController.text, yearController.text,_platformImei);
        },
        elevation: 0.0,
        color: Colors.purple,
        child: Text("Sign Up", style: TextStyle(color: Colors.white70)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController nmeController = new TextEditingController();
  final TextEditingController lastController = new TextEditingController();
  final TextEditingController userController = new TextEditingController();
  final TextEditingController placeController = new TextEditingController();
  final TextEditingController yearController = new TextEditingController();
  

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: nmeController,
            cursorColor: Colors.white,

            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.accessibility_new, color: Colors.white70),
              hintText: "Nombre",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          TextFormField(
            controller: lastController,
            cursorColor: Colors.white,

            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.accessibility_new, color: Colors.white70),
              hintText: "Apellido",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          TextFormField(
            controller: placeController,
            cursorColor: Colors.white,

            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.add_location, color: Colors.white70),
              hintText: "Estado de procedencia",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          TextFormField(
            controller: yearController,
            cursorColor: Colors.white,

            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.access_time, color: Colors.white70),
              hintText: "¿Cuántos años dejaste de estudiar?",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          TextFormField(
            controller: userController,
            cursorColor: Colors.white,

            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.account_box, color: Colors.white70),
              hintText: "Nombre de usuario",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: emailController,
            cursorColor: Colors.white,

            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.white70),
              hintText: "Email",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.white,
            obscureText: true,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white70),
              hintText: "Password",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  Container headerSection() {
    initPlatformState();
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Preparación COLBACH",
          style: TextStyle(
              color: Colors.white70,
              fontSize: 40.0,
              fontWeight: FontWeight.bold)),
    );
  }
  void _showAlertDialog(eemail,usuariio) {
    String correo = eemail;
    String usuario = usuariio;
    showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          title: Text("Alerta"),
          content: Text("El correo $correo y usuario $usuario ya están registrados"),
          actions: <Widget>[
            RaisedButton(
              child: Text("CERRAR", style: TextStyle(color: Colors.black),),
              onPressed: (){ Navigator.of(context).pop(); },
            )
          ],
        );
      }
    );
  }
}
