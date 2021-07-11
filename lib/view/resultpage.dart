import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:appnode/view/quizhome.dart';
import 'respuesta.dart';
Respuesta notificacion = Respuesta();
class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key , @required this.marks}) : super(key : key);
  
  @override
  _resultpageState createState() => _resultpageState(marks);
   List<int> temas= [];
  int n=0;
  ResetIncorrecto(){
      temas.clear();
    }
    Guardaincorrecto(int tema){
      
        
        print(tema);
        
      
          temas.insert(n, tema);
          n+=1;

        
        print('finale $temas');
        //Notificaincorrecto(temas);
        return temas;
        
    }
    
}

class _resultpageState extends State<resultpage> {

  List<String> images = [
    "assets/images/success.png",
    "assets/images/good.png",
    "assets/images/bad.png",
  ];

  String message;
  String image;

  @override
  void initState(){
    if(marks < 20){
      image = images[2];
      message = "You Should Try Hard..\n" + "You Scored $marks";
      
      //notificacion.Notificaincorrecto();
    }else if(marks < 35){
      image = images[1];
      message = "You Can Do Better..\n" + "You Scored $marks";
      //notificacion.Notificaincorrecto();
    }else{
      image = images[0];
      message = "You Did Very Well..\n" + "You Scored $marks";
      //notificacion.Notificaincorrecto();
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0,
                      ),
                      child: Center(
                      child: Text(
                        message,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Quando",
                        ),
                      ),
                    )
                    ),
                  ],
                ),
              ),
            ),            
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Quiz(),
                    ));
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  borderSide: BorderSide(width: 3.0, color: Colors.indigo),
                  splashColor: Colors.indigoAccent,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  
}